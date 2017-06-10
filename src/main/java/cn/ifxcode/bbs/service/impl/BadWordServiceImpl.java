package cn.ifxcode.bbs.service.impl;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;

import cn.ifxcode.bbs.bean.Page;
import cn.ifxcode.bbs.constant.BbsConstant;
import cn.ifxcode.bbs.dao.BadWordDao;
import cn.ifxcode.bbs.entity.BadWord;
import cn.ifxcode.bbs.logger.SysLog;
import cn.ifxcode.bbs.service.BadWordService;

@Service
public class BadWordServiceImpl implements BadWordService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private BadWordDao badWordDao;
	
	@Override
	@SysLog(module = "系统配置", methods = "敏感词-添加")
	public int add(String word) {
		int result = 0;
		try {
			BadWord badWord = new BadWord(word);
			if(BbsConstant.OK == badWordDao.add(badWord)) {
				result = BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("add badword error", e);
		}
		return result;
	}

	@Override
	@Transactional
	@SysLog(module = "系统配置", methods = "敏感词-删除")
	public int delete(String ids) {
		int result = 0;
		String badIds[] = ids.split(",");
		try {
			Map<String, Object> map = Maps.newHashMap();
			map.put("badIds", badIds);
			if(badIds.length == badWordDao.delete(map)) {
				result = BbsConstant.OK;
			}
		} catch (Exception e) {
			logger.error("delete badword error", e);
		}
		return result;
	}

	@Override
	public List<BadWord> getBadWords(Page page) {
		return getBadWords(page, null);
	}

	@Override
	public List<BadWord> getBadWords(Page page, String word) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("page", page);
		if(StringUtils.isNotBlank(word)) {
			map.put("word", "%" + word + "%");
		}
		return badWordDao.getBadWords(map);
	}

	@Override
	@Transactional
	@SysLog(module = "系统配置", methods = "敏感词-导入")
	@Async
	public int batchSave(List<BadWord> list) {
		return new BadWord().batchSave(list, Calendar.getInstance().getTime());
	}

}
