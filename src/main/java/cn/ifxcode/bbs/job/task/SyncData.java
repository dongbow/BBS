package cn.ifxcode.bbs.job.task;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import cn.ifxcode.bbs.dao.BoardInfoDao;
import cn.ifxcode.bbs.entity.Board;
import cn.ifxcode.bbs.entity.BoardInfo;
import cn.ifxcode.bbs.service.BoardService;

@Service
public class SyncData {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private BoardInfoDao boardInfoDao; 
	
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
	
}
