package cn.ifxcode.bbs.job.task;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import cn.ifxcode.bbs.dao.BoardInfoDao;
import cn.ifxcode.bbs.dao.ClassifyDao;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.BoardInfo;
import cn.ifxcode.bbs.entity.Classify;
import cn.ifxcode.bbs.service.BoardService;
import cn.ifxcode.bbs.service.ClassifyService;

@Service
public class SyncData {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private BoardInfoDao boardInfoDao; 
	
	@Resource
	private ClassifyService classifyService;
	
	@Resource
	private ClassifyDao classifyDao;
	
	public void syncTopicData() {
		
	}
	
	public void syncBoardInfo() {
		logger.info("start sync boardinfo");
		try {
			List<Board> boards = boardService.getAllBoard();
			for (Board board : boards) {
				BoardInfo info = boardService.getBoardInfoFromRedis(board.getBoardId());
				boardInfoDao.updateBoardInfo(info);
			}
		} catch (Exception e) {
			logger.error("sync boardinfo fail", e);
		}
	}
	
	public void syncClassify() {
		logger.info("start sync classify");
		try {
			List<Classify> classifies = new ArrayList<Classify>();
			List<Board> boards = boardService.getAllBoard();
			for (Board board : boards) {
				List<Classify> list = classifyService.getClassifyByBoardId(board.getBoardId());
				classifies.addAll(list);
			}
			for (Classify classify : classifies) {
				classifyDao.syncTopicCount(classify.getClassId(), classify.getClassTopicCount());
			}
		} catch (Exception e) {
			logger.error("sync classify fail", e);
		}
	}
	
}
