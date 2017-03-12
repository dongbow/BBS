package cn.ifxcode.bbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ltang.redis.service.RedisObjectMapService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.ifxcode.bbs.bean.CookieBean;
import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.constant.BbsErrorCode;
import cn.ifxcode.bbs.entity.BmcLog;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.Navigation;
import cn.ifxcode.bbs.entity.Reply;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.entity.User;
import cn.ifxcode.bbs.enumtype.Audit;
import cn.ifxcode.bbs.enumtype.RoleSign;
import cn.ifxcode.bbs.enumtype.Speak;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.GeneralService;
import cn.ifxcode.bbs.service.NavigationService;
import cn.ifxcode.bbs.service.OperationLogService;
import cn.ifxcode.bbs.service.ReplyService;
import cn.ifxcode.bbs.service.TopicService;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.FormValidate;
import cn.ifxcode.bbs.utils.JsonUtils;
import cn.ifxcode.bbs.utils.ParamsBuildUtils;
import cn.ifxcode.bbs.utils.RedisKeyUtils;

@Controller
@RequestMapping("/manage/bmc")
public class BoardManagerController {

	private static final int DEFAULT_PAGE_SIZE = 10;
	
	@Resource
	private UserService userService;
	
	@Resource
	private NavigationService navigationService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private GeneralService generalService;
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private ReplyService replyService;
	
	@Resource
	private RedisObjectMapService redisObjectMapService;
	
	@Resource
	private OperationLogService operationLogService;
	
	@RequestMapping("/bcm")
	public String bcm() {
		return "boardmanager/bcm";
	}
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		CookieBean bean = userService.getCookieBeanFromCookie(request);
		User user = userService.getUserByIdFromRedis(Long.toString(bean.getUser_id()));
		List<Navigation> navigations = null;
		if(user.getUserAccess().getUserIsAdmin() == 1) {
			JSONObject object = redisObjectMapService.get(RedisKeyUtils.getNavigations(), JSONObject.class);
			JSONArray array = JSONArray.parseArray(object.getString("navigations"));
			navigations = JsonUtils.decodeJson(array, Navigation.class);
			for (Navigation n : navigations) {
				JSONObject boardObject = redisObjectMapService.get(RedisKeyUtils.getBoardsByNavId((int) n.getNavId()), JSONObject.class);
				JSONArray boardArray = JSONArray.parseArray(boardObject.getString("boards"));
				n.setBoards(JsonUtils.decodeJson(boardArray, Board.class));
			}
		} else {
			List<Integer> boardIds = userService.getAllBoardManageId(bean.getUser_id());
			navigations = navigationService.getBCMNavs(boardIds);
		}
		model.addAttribute("navigations", navigations);
		model.addAttribute("user", user);
		return "boardmanager/index";
	}
	
	@RequestMapping(value = "/audit/topic", method = RequestMethod.GET)
	public String topicAudit(@RequestParam(value = "page", required = false, defaultValue = "1")String pageNo, 
			String bid, HttpServletRequest request, Model model) {
		if(StringUtils.isNotBlank(bid) && FormValidate.number(bid) && FormValidate.number(pageNo)) {
			if(boardService.isExists(bid)) {
				if(generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int p = Integer.parseInt(pageNo) > 0 ?Integer.parseInt(pageNo) : 1;
					Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
					List<Topic> topics = topicService.getTopicList(page, Integer.parseInt(bid));
					model.addAttribute("page", page);
					model.addAttribute("bid", bid);
					model.addAttribute("topics", topics);
					return "boardmanager/audit-topic";
				} else {
					return "redirect:/tip?tip=noauth";
				}
			} else {
				return "redirect:/tip?tip=board-notexists";
			}
		}
		return "redirect:/tip?tip=board-notexists";
	}
	
	@ResponseBody
	@RequestMapping(value = "/audit/topic/pass", method = RequestMethod.POST)
	public Result topicAuditPass(@RequestParam(value = "ids[]")String ids, @RequestParam(required = false)String bid, 
			HttpServletRequest request) {
		Result result = null;
		if (StringUtils.isNotBlank(ids) && StringUtils.isNotBlank(bid) && FormValidate.number(bid)) {
			if (boardService.isExists(bid)) {
				if (generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int rc = topicService.audit(ids, Audit.PASS.getValue());
					if (rc == BbsConstant.OK) {
						result = new Result(BbsConstant.OK, "通过成功");
					} else {
						result = new Result(BbsConstant.ERROR, "通过失败");
					}
				} else {
					result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
				}
			} else {
				result = new Result(BbsConstant.ERROR, "数据有误");
			}
		} else {
			result = new Result(BbsConstant.OK, "数据有误");	
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/audit/topic/delete", method = RequestMethod.POST)
	public Result topicAuditRefault(@RequestParam(value = "ids[]")String ids, @RequestParam(required = false)String bid, 
			HttpServletRequest request) {
		Result result = null;
		if (StringUtils.isNotBlank(ids) && StringUtils.isNotBlank(bid) && FormValidate.number(bid)) {
			if (boardService.isExists(bid)) {
				if (generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int rc = topicService.audit(ids, Audit.REFAUSE.getValue());
					if (rc == BbsConstant.OK) {
						result = new Result(BbsConstant.OK, "删除成功");
					} else {
						result = new Result(BbsConstant.ERROR, "删除失败");
					}
				} else {
					result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
				}
			} else {
				result = new Result(BbsConstant.ERROR, "数据有误");
			}
		} else {
			result = new Result(BbsConstant.OK, "数据有误");	
		}
		return result;
	}
	
	@RequestMapping(value = {"/audit/reply", "/audit/reply/search"}, method = RequestMethod.GET)
	public String replyAudit(@RequestParam(value = "page", required = false, defaultValue = "1")String pageNo, 
			@RequestParam(value = "tid", required = false)String topicId, 
			String bid, HttpServletRequest request, Model model) {
		if(StringUtils.isNotBlank(bid) && FormValidate.number(bid) && FormValidate.number(pageNo)) {
			if(boardService.isExists(bid)) {
				if(generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int p = Integer.parseInt(pageNo) > 0 ?Integer.parseInt(pageNo) : 1;
					Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
					long tid = 0;
					if(StringUtils.isNotBlank(topicId) && FormValidate.number(topicId)) {
						tid = Long.parseLong(topicId);
						model.addAttribute("tid", tid);
					}
					List<Reply> replies = replyService.getReplyList(page, Integer.parseInt(bid), tid);
					model.addAttribute("page", page);
					model.addAttribute("bid", bid);
					model.addAttribute("replies", replies);
					return "boardmanager/audit-reply";
				} else {
					return "redirect:/tip?tip=noauth";
				}
			} else {
				return "redirect:/tip?tip=board-notexists";
			}
		}
		return "redirect:/tip?tip=board-notexists";
	}
	
	@ResponseBody
	@RequestMapping(value = "/audit/reply/pass", method = RequestMethod.POST)
	public Result auditReplyPass(@RequestParam(value = "ids[]")String ids, @RequestParam(required = false)String bid, 
			HttpServletRequest request) {
		Result result = null;
		if (StringUtils.isNotBlank(ids) && StringUtils.isNotBlank(bid) && FormValidate.number(bid)) {
			if (boardService.isExists(bid)) {
				if (generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int rc = replyService.execAudit(ids, Audit.PASS.getValue());
					if (rc == BbsConstant.OK) {
						result = new Result(BbsConstant.OK, "通过成功");
					} else {
						result = new Result(BbsConstant.ERROR, "通过失败");
					}
				} else {
					result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
				}
			} else {
				result = new Result(BbsConstant.ERROR, "数据有误");
			}
		} else {
			result = new Result(BbsConstant.OK, "数据有误");	
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/audit/reply/delete", method = RequestMethod.POST)
	public Result auditReplyRefause(@RequestParam(value = "ids[]")String ids, @RequestParam(required = false)String bid, 
			HttpServletRequest request) {
		Result result = null;
		if (StringUtils.isNotBlank(ids) && StringUtils.isNotBlank(bid) && FormValidate.number(bid)) {
			if (boardService.isExists(bid)) {
				if (generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int rc = replyService.execAudit(ids, Audit.REFAUSE.getValue());
					if (rc == BbsConstant.OK) {
						result = new Result(BbsConstant.OK, "删除成功");
					} else {
						result = new Result(BbsConstant.ERROR, "删除失败");
					}
				} else {
					result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
				}
			} else {
				result = new Result(BbsConstant.ERROR, "数据有误");
			}
		} else {
			result = new Result(BbsConstant.OK, "数据有误");	
		}
		return result;
	}
	
	@RequestMapping(value = {"/trash/topic", "/trash/topic/search"}, method = RequestMethod.GET)
	public String topicTrash(@RequestParam(value = "page", required = false, defaultValue = "1")String pageNo, 
			@RequestParam(required = false)String uid, 
			@RequestParam(required = false)String tid, 
			String bid, HttpServletRequest request, Model model) {
		if(StringUtils.isNotBlank(bid) && FormValidate.number(bid) && FormValidate.number(pageNo)) {
			if(boardService.isExists(bid)) {
				if(generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int p = Integer.parseInt(pageNo) > 0 ?Integer.parseInt(pageNo) : 1;
					Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
					long userId = 0;
					long topicId = 0;
					if(StringUtils.isNotBlank(uid) && FormValidate.number(uid)) {
						userId = Long.parseLong(uid);
						model.addAttribute("uid", userId);
					}
					if(StringUtils.isNotBlank(tid) && FormValidate.number(tid)) {
						topicId = Long.parseLong(tid);
						model.addAttribute("tid", topicId);
					}
					List<Topic> topics = topicService.getTopicList(page, null, null, userId, topicId, 0, Integer.parseInt(bid), 0, 1, 2);
					model.addAttribute("page", page);
					model.addAttribute("bid", bid);
					model.addAttribute("topics", topics);
					return "boardmanager/trash-topic";
				} else {
					return "redirect:/tip?tip=noauth";
				}
			} else {
				return "redirect:/tip?tip=board-notexists";
			}
		}
		return "redirect:/tip?tip=board-notexists";
	}
	
	@ResponseBody
	@RequestMapping(value = "/trash/topic/restore", method = RequestMethod.POST)
	public Result trashTopicRestore(@RequestParam(value = "ids[]")String ids, @RequestParam(required = false)String bid, 
			HttpServletRequest request) {
		Result result = null;
		if (StringUtils.isNotBlank(ids) && StringUtils.isNotBlank(bid) && FormValidate.number(bid)) {
			if (boardService.isExists(bid)) {
				if (generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int rc = topicService.restore(ids, RoleSign.BMC.getSign());
					if (rc == BbsConstant.OK) {
						result = new Result(BbsConstant.OK, "恢复成功");
					} else {
						result = new Result(BbsConstant.ERROR, "恢复失败");
					}
				} else {
					result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
				}
			} else {
				result = new Result(BbsConstant.ERROR, "数据有误");
			}
		} else {
			result = new Result(BbsConstant.OK, "数据有误");	
		}
		return result;
	}
	
	@RequestMapping(value = {"/trash/reply", "/trash/reply/search"}, method = RequestMethod.GET)
	public String replyTrash(@RequestParam(value = "page", required = false, defaultValue = "1")String pageNo, 
			@RequestParam(value = "uid", required = false)String userId,
			@RequestParam(value = "tid", required = false)String topicId, 
			String bid, HttpServletRequest request, Model model) {
		if(StringUtils.isNotBlank(bid) && FormValidate.number(bid) && FormValidate.number(pageNo)) {
			if(boardService.isExists(bid)) {
				if(generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int p = Integer.parseInt(pageNo) > 0 ?Integer.parseInt(pageNo) : 1;
					Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
					long uid = 0;
					long tid = 0;
					if(StringUtils.isNotBlank(userId) && FormValidate.number(userId)) {
						uid = Long.parseLong(userId);
						model.addAttribute("uid", uid);
					}
					if(StringUtils.isNotBlank(topicId) && FormValidate.number(topicId)) {
						tid = Long.parseLong(topicId);
						model.addAttribute("tid", tid);
					}
					List<Reply> replies = replyService.getReplyList(page, 1, 2, null, null, uid, tid, Integer.parseInt(bid));
					model.addAttribute("page", page);
					model.addAttribute("bid", bid);
					model.addAttribute("replies", replies);
					return "boardmanager/trash-reply";
				} else {
					return "redirect:/tip?tip=noauth";
				}
			} else {
				return "redirect:/tip?tip=board-notexists";
			}
		}
		return "redirect:/tip?tip=board-notexists";
	}
	
	@ResponseBody
	@RequestMapping(value = "/trash/reply/restore", method = RequestMethod.POST)
	public Result trashReplyRestore(@RequestParam(value = "ids[]")String ids, @RequestParam(required = false)String bid, 
			HttpServletRequest request) {
		Result result = null;
		if (StringUtils.isNotBlank(ids) && StringUtils.isNotBlank(bid) && FormValidate.number(bid)) {
			if (boardService.isExists(bid)) {
				if (generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int rc = replyService.restore(ids, RoleSign.BMC.getSign());
					if (rc == BbsConstant.OK) {
						result = new Result(BbsConstant.OK, "恢复成功");
					} else {
						result = new Result(BbsConstant.ERROR, "恢复失败");
					}
				} else {
					result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
				}
			} else {
				result = new Result(BbsConstant.ERROR, "数据有误");
			}
		} else {
			result = new Result(BbsConstant.OK, "数据有误");	
		}
		return result;
	}
	
	@RequestMapping(value = {"/closereply", "/closereply/search"}, method = RequestMethod.GET)
	public String notReply(@RequestParam(value = "page", required = false, defaultValue = "1")String pageNo, 
			@RequestParam(value = "tid", required = false)String topicId,
			String bid, HttpServletRequest request, Model model) {
		if(StringUtils.isNotBlank(bid) && FormValidate.number(bid) && FormValidate.number(pageNo)) {
			if(boardService.isExists(bid)) {
				if(generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int p = Integer.parseInt(pageNo) > 0 ?Integer.parseInt(pageNo) : 1;
					Page page = Page.newBuilder(p, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
					long tid = 0;
					if(StringUtils.isNotBlank(topicId) && FormValidate.number(topicId)) {
						tid = Long.parseLong(topicId);
						model.addAttribute("tid", tid);
					}
					List<Topic> topics = topicService.getTopicCloseReplyList(page, tid, 0, Integer.parseInt(bid));
					model.addAttribute("page", page);
					model.addAttribute("bid", bid);
					model.addAttribute("topics", topics);
					return "boardmanager/notreply";
				} else {
					return "redirect:/tip?tip=noauth";
				}
			} else {
				return "redirect:/tip?tip=board-notexists";
			}
		}
		return "redirect:/tip?tip=board-notexists";
	}
	
	@ResponseBody
	@RequestMapping(value = "/closereply/open", method = RequestMethod.POST)
	public Result openReply(@RequestParam(value = "ids[]")String ids, @RequestParam(required = false)String bid, 
			HttpServletRequest request) {
		Result result = null;
		if (StringUtils.isNotBlank(ids) && StringUtils.isNotBlank(bid) && FormValidate.number(bid)) {
			if (boardService.isExists(bid)) {
				if (generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int rc = topicService.openReply(ids, RoleSign.BMC.getSign());
					if (rc == BbsConstant.OK) {
						result = new Result(BbsConstant.OK, "开启成功");
					} else {
						result = new Result(BbsConstant.ERROR, "开启失败");
					}
				} else {
					result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
				}
			} else {
				result = new Result(BbsConstant.ERROR, "数据有误");
			}
		} else {
			result = new Result(BbsConstant.OK, "数据有误");	
		}
		return result;
	}
	
	@RequestMapping(value = {"/user/notspeak", "/user/notspeak/search"}, method = RequestMethod.GET)
	public String notSpeak(@RequestParam(value = "page", required = false, defaultValue = "1")String pageNo, 
			@RequestParam(value = "uid", required = false)String userId, 
			@RequestParam(required = false)String nickname, 
			HttpServletRequest request, Model model) {
		int pno = 1;
		if(FormValidate.number(pageNo)) {
			pno = Integer.parseInt(pageNo);
		}
		long uid = 0;
		if(StringUtils.isNotBlank(userId) && FormValidate.number(userId)) {
			uid = Long.parseLong(userId);
			model.addAttribute("uid", uid);
		}
		if(StringUtils.isNotBlank(nickname)) {
			model.addAttribute("nickname", nickname);
		}
		Page page = Page.newBuilder(pno, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<User> users = userService.getAllNotTalkUser(page, uid, nickname);
		model.addAttribute("page", page);
		model.addAttribute("users", users);
		return "boardmanager/notspeak";
	}
	
	@ResponseBody
	@RequestMapping(value = "/notspeak/open", method = RequestMethod.POST)
	public Result openSpeak(@RequestParam(value = "ids[]")String ids) {
		Result result = null;
		if (StringUtils.isBlank(ids)) {
			return new Result(BbsConstant.ERROR, "参数错误");
		}
		int row = userService.speak(ids, Speak.OPEN.getValue(), RoleSign.BMC.getSign());
		if (row == BbsConstant.OK) {
			result = new Result(BbsConstant.OK, "成功");
		} else {
			result = new Result(BbsConstant.ERROR, "失败");
		}
		return result;
	}
	
	@RequestMapping(value = {"/option", "/option/search"})
	public String options(@RequestParam(value = "page", required = false, defaultValue = "1")String pageNo, 
			@RequestParam(required = false)String from, @RequestParam(required = false)String to, 
			HttpServletRequest request, Model model) {
		int pno = 1;
		if(FormValidate.number(pageNo)) {
			pno = Integer.parseInt(pageNo);
		}
		Page page = Page.newBuilder(pno, DEFAULT_PAGE_SIZE, ParamsBuildUtils.createUrl(request));
		List<BmcLog> logs = operationLogService.getBMClog(from, to, page);
		model.addAttribute("page", page);
		model.addAttribute("logs", logs);
		if(StringUtils.isNotBlank(from)) {
			model.addAttribute("from", from);
		}
		if(StringUtils.isNotBlank(to)) {
			model.addAttribute("to", to);
		}
		return "boardmanager/options";
	}
	
	@RequestMapping(value = "/topic/delete", method = RequestMethod.GET)
	public String delete() {
		return "topic/delete";
	}
	
	@ResponseBody
	@RequestMapping(value = "/topic/delete", method = RequestMethod.POST)
	public Result doDelete(String tid, String bid, String rs, String other, String sign, 
			HttpServletRequest request) {
		Result result = null;
		if(FormValidate.stringUtils(tid, rs, sign, bid)) {
			if (!boardService.isExists(bid)) {
				return new Result(BbsConstant.ERROR, "版块不存在");
			}
			if (!generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
				return new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
			}
			if("其他".equals(rs)) {
				if(StringUtils.isEmpty(other) || other.length() < 5 || other.length() > 50) {
					return new Result(BbsConstant.ERROR, "原因过长或过短");
				}
			}
			String reason = StringUtils.isBlank(other) ? rs : other;
			if(topicService.deleteTopic(tid, reason, sign) == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "删除成功");
			} else {
				result = new Result(BbsConstant.ERROR, "删除失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "删除失败");
		}
		return result;
	}
	
	@RequestMapping(value = "/reply/delete", method = RequestMethod.GET)
	public String replyDelete() {
		return "topic/delete";
	}
	
	@ResponseBody
	@RequestMapping(value = "/reply/delete", method = RequestMethod.POST)
	public Result doReplyDelete(String rid, String bid, String rs, String other, String sign, 
			HttpServletRequest request) {
		Result result = null;
		if(FormValidate.stringUtils(rid, rs, sign, bid)) {
			if (!boardService.isExists(bid)) {
				return new Result(BbsConstant.ERROR, "版块不存在");
			}
			if (!generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
				return new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
			}
			if("其他".equals(rs)) {
				if(StringUtils.isEmpty(other) || other.length() < 5 || other.length() > 50) {
					return new Result(BbsConstant.ERROR, "原因过长或过短");
				}
			}
			String reason = StringUtils.isBlank(other) ? rs : other;
			if(replyService.deleteReply(rid, reason, sign) == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "删除成功");
			} else {
				result = new Result(BbsConstant.ERROR, "删除失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "删除失败");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/topic/openreply", method = RequestMethod.POST)
	public Result topicOpenReply(String tid, String bid, String role, 
			HttpServletRequest request) {
		Result result = null;
		if (FormValidate.stringUtils(tid, bid, role) && FormValidate.number(bid) && FormValidate.number(tid)) {
			if (boardService.isExists(bid)) {
				if (generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int rc = topicService.openReply(tid, role);
					if (rc == BbsConstant.OK) {
						result = new Result(BbsConstant.OK, "开启成功");
					} else {
						result = new Result(BbsConstant.ERROR, "开启失败");
					}
				} else {
					result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
				}
			} else {
				result = new Result(BbsConstant.ERROR, "数据有误");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "数据有误");	
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/topic/closereply", method = RequestMethod.POST)
	public Result topicCloseReply(String tid, String bid, String role, 
			HttpServletRequest request) {
		Result result = null;
		if (FormValidate.stringUtils(tid, bid, role) && FormValidate.number(bid) && FormValidate.number(tid)) {
			if (boardService.isExists(bid)) {
				if (generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int rc = topicService.closeReply(tid, role);
					if (rc == BbsConstant.OK) {
						result = new Result(BbsConstant.OK, "关闭成功");
					} else {
						result = new Result(BbsConstant.ERROR, "关闭失败");
					}
				} else {
					result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
				}
			} else {
				result = new Result(BbsConstant.ERROR, "数据有误");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "数据有误");	
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/topic/cream", method = RequestMethod.POST)
	public Result topicCream(String tid, String bid, String role, 
			HttpServletRequest request) {
		Result result = null;
		if (FormValidate.stringUtils(tid, bid, role) && FormValidate.number(bid) && FormValidate.number(tid)) {
			if (boardService.isExists(bid)) {
				if (generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int rc = topicService.cream(tid, 1, role);
					if (rc == BbsConstant.OK) {
						result = new Result(BbsConstant.OK, "成功");
					} else {
						result = new Result(BbsConstant.ERROR, "失败");
					}
				} else {
					result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
				}
			} else {
				result = new Result(BbsConstant.ERROR, "数据有误");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "数据有误");	
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/topic/qxcream", method = RequestMethod.POST)
	public Result topicQxCream(String tid, String bid, String role, 
			HttpServletRequest request) {
		Result result = null;
		if (FormValidate.stringUtils(tid, bid, role) && FormValidate.number(bid) && FormValidate.number(tid)) {
			if (boardService.isExists(bid)) {
				if (generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int rc = topicService.cream(tid, 0, role);
					if (rc == BbsConstant.OK) {
						result = new Result(BbsConstant.OK, "成功");
					} else {
						result = new Result(BbsConstant.ERROR, "失败");
					}
				} else {
					result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
				}
			} else {
				result = new Result(BbsConstant.ERROR, "数据有误");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "数据有误");	
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/topic/localtop", method = RequestMethod.POST)
	public Result topicLocalTop(String tid, String bid, String role, String time, 
			HttpServletRequest request) {
		Result result = null;
		if (FormValidate.stringUtils(tid, bid, role) && FormValidate.number(bid) && FormValidate.number(tid)) {
			if (boardService.isExists(bid)) {
				if (generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int rc = topicService.localTop(tid, time, 1, role);
					if (rc == BbsConstant.OK) {
						result = new Result(BbsConstant.OK, "成功");
					} else {
						result = new Result(BbsConstant.ERROR, "失败");
					}
				} else {
					result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
				}
			} else {
				result = new Result(BbsConstant.ERROR, "数据有误");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "数据有误");	
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/topic/qxlocaltop", method = RequestMethod.POST)
	public Result topicQxLocalTop(String tid, String bid, String role, 
			HttpServletRequest request) {
		Result result = null;
		if (FormValidate.stringUtils(tid, bid, role) && FormValidate.number(bid) && FormValidate.number(tid)) {
			if (boardService.isExists(bid)) {
				if (generalService.isLocalBMCByBoardId(Integer.parseInt(bid), request)) {
					int rc = topicService.localTop(tid, null, 0, role);
					if (rc == BbsConstant.OK) {
						result = new Result(BbsConstant.OK, "成功");
					} else {
						result = new Result(BbsConstant.ERROR, "失败");
					}
				} else {
					result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
				}
			} else {
				result = new Result(BbsConstant.ERROR, "数据有误");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "数据有误");	
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/topic/home", method = RequestMethod.POST)
	public Result topicHome(String tid, String time, HttpServletRequest request) {
		Result result = null;
		if (FormValidate.stringUtils(tid) && FormValidate.number(tid)) {
			if (generalService.authCheck(request)) {
				int rc = topicService.home(tid, time, 1);
				if (rc == BbsConstant.OK) {
					result = new Result(BbsConstant.OK, "成功");
				} else {
					result = new Result(BbsConstant.ERROR, "失败");
				}
			} else {
				result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
			}
		} else {
			result = new Result(BbsConstant.ERROR, "数据有误");	
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/topic/qxhome", method = RequestMethod.POST)
	public Result topicQxHome(String tid, HttpServletRequest request) {
		Result result = null;
		if (FormValidate.stringUtils(tid) && FormValidate.number(tid)) {
			if (generalService.authCheck(request)) {
				int rc = topicService.home(tid, null, 0);
				if (rc == BbsConstant.OK) {
					result = new Result(BbsConstant.OK, "成功");
				} else {
					result = new Result(BbsConstant.ERROR, "失败");
				}
			} else {
				result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
			}
		} else {
			result = new Result(BbsConstant.ERROR, "数据有误");	
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/topic/globaltop", method = RequestMethod.POST)
	public Result topicGlobal(String tid, String time, HttpServletRequest request) {
		Result result = null;
		if (FormValidate.stringUtils(tid) && FormValidate.number(tid)) {
			if (generalService.authCheck(request)) {
				int rc = topicService.globalTop(tid, time, 1);
				if (rc == BbsConstant.OK) {
					result = new Result(BbsConstant.OK, "成功");
				} else {
					result = new Result(BbsConstant.ERROR, "失败");
				}
			} else {
				result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
			}
		} else {
			result = new Result(BbsConstant.ERROR, "数据有误");	
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/topic/qxglobaltop", method = RequestMethod.POST)
	public Result topicQxglobalTop(String tid, HttpServletRequest request) {
		Result result = null;
		if (FormValidate.stringUtils(tid) && FormValidate.number(tid)) {
			if (generalService.authCheck(request)) {
				int rc = topicService.globalTop(tid, null, 0);
				if (rc == BbsConstant.OK) {
					result = new Result(BbsConstant.OK, "成功");
				} else {
					result = new Result(BbsConstant.ERROR, "失败");
				}
			} else {
				result = new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
			}
		} else {
			result = new Result(BbsConstant.ERROR, "数据有误");	
		}
		return result;
	}
	
	@RequestMapping(value = "/topic/move", method = RequestMethod.GET)
	public String move() {
		
		return "topic/move";
	}
	
	@ResponseBody
	@RequestMapping(value = "/topic/move", method = RequestMethod.POST)
	public Result doMove(String tid, String srcbid, String destbid, String cid, String gid, 
			String role, HttpServletRequest request) {
		Result result = null;
		if(FormValidate.stringUtils(tid, srcbid, destbid, cid, gid)) {
			if (!boardService.isExists(srcbid)) {
				return new Result(BbsConstant.ERROR, "版块不存在");
			}
			if (!boardService.isExists(destbid)) {
				return new Result(BbsConstant.ERROR, "版块不存在");
			}
			if (!generalService.isLocalBMCByBoardId(Integer.parseInt(srcbid), request)) {
				return new Result(BbsErrorCode.NOT_AUTH, BbsErrorCode.getDescribe(BbsErrorCode.NOT_AUTH));
			}
			if(topicService.move(tid, destbid, cid, gid, role) == BbsConstant.OK) {
				result = new Result(BbsConstant.OK, "成功");
			} else {
				result = new Result(BbsConstant.ERROR, "失败");
			}
		} else {
			result = new Result(BbsConstant.ERROR, "失败");
		}
		return result;
	}
	
}
