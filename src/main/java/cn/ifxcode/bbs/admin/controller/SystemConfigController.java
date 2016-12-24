package cn.ifxcode.bbs.admin.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import cn.ifxcode.bbs.bean.Result;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.entity.Topic;
import cn.ifxcode.bbs.lucene.LuceneIndexUtils;
import cn.ifxcode.bbs.service.TopicService;

@Controller
@RequestMapping("/system/admin/config")
public class SystemConfigController extends BaseController {

	@Resource
	private TopicService topicService;
	
	@ResponseBody
	@RequestMapping(value = "/lucene/init")
	public Result initIndex() {
		Result result = null;
		List<Topic> topics = topicService.getTopicListForIndex();
		if(LuceneIndexUtils.initIndex(topics)) {
			result = new Result(BbsConstant.OK, "索引初始化成功！");
		} else {
			result = new Result(BbsConstant.ERROR, "索引初始化失败！");
		}
		return result;
	}
	
}
