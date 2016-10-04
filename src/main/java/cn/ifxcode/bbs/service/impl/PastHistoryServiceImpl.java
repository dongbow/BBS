package cn.ifxcode.bbs.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ifxcode.bbs.dao.PastHistoryDao;
import cn.ifxcode.bbs.service.PastHistoryService;

@Service
public class PastHistoryServiceImpl implements PastHistoryService {

	@Resource
	private PastHistoryDao pastHistoryDao;
	
}
