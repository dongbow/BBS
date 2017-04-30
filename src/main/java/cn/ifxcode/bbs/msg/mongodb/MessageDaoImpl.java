package cn.ifxcode.bbs.msg.mongodb;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

import cn.ifxcode.bbs.msg.entity.Message;

@Component
public class MessageDaoImpl implements MessageDao {

	@Resource
	private MongoTemplate mongoTemplate;
	
	@Override
	public void insert(Message object, String collectionName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Message findOne(Map<String, Object> params, String collectionName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Message> findAll(Map<String, Object> params,
			String collectionName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Map<String, Object> params, String collectionName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createCollection(String collectionName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Map<String, Object> params, String collectionName) {
		// TODO Auto-generated method stub
		
	}

}
