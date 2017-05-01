package cn.ifxcode.bbs.msg.mongodb;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Component;

import cn.ifxcode.bbs.msg.entity.Message;

@Component
public class MessageDaoImpl implements MessageDao {

	@Resource
	private MongoTemplate mongoTemplate;
	
	@Override
	public void insert(Message object, String collectionName) {
		mongoTemplate.insert(object, collectionName);
	}

	@Override
	public Message findOne(Map<String, Object> params, String collectionName) {
		return mongoTemplate.findOne(new Query(Criteria.where("").is(params.get(""))), Message.class, collectionName);
	}

	@Override
	public List<Message> findAll(Map<String, Object> params, String collectionName) {
		List<Message> messages = mongoTemplate.find(new Query(Criteria.where("").lt(params.get(""))), Message.class, collectionName); 
		return messages;
	}

	@Override
	public void update(Map<String, Object> params, String collectionName) {
		mongoTemplate.upsert(new Query(Criteria.where("").is(params.get(""))), new Update().set("", params.get("")), Message.class, collectionName);
	}

	@Override
	public void createCollection(String collectionName) {
		mongoTemplate.createCollection(collectionName);
	}

	@Override
	public void remove(Map<String, Object> params, String collectionName) {
		mongoTemplate.remove(new Query(Criteria.where("").is(params.get(""))), Message.class, collectionName);
	}

}
