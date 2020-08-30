package com.privateplaylist.www.teacher.chat.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Message;



@Repository
@Mapper
public class ChatDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//채팅내역 전체출력
	public List<Message> getChatListById(Map<String,String> param){
		return sqlSession.selectList("Message.getChatListById", param);
	}
	
	//최근 채팅내역 몇개반 가져옴(cnt 수 만큼)
	public List<Message> getChatListByRecent(Map<String,Object> param){
		return sqlSession.selectList("Message.getChatListByRecent",param);
	}
		
	//메시지를 보내는 메서드에 저장
	public int submit(Message chat) {
		return sqlSession.insert("Message.submit",chat);
	}
	
	//메시지 읽었는지 체크
	public int readChat(Map<String, String> param) {
		return sqlSession.update("Message.readChat",param);
	}
	
	//읽지 않았는지 메시지의 수 가쳐오기
	public int getAllUnreadChat(String userID) {
		return sqlSession.selectOne("Message.getAllUnreadChat",userID);
	}
	
	//메시지함에 메시지 가지고오는 함수 구현
	public List<Message> getBox(String userID){
		return sqlSession.selectList("Message.getBox",userID);
	}
	
	//안읽은 메시지 가져오기
	public int geUnreadChat(Map<String,String> map) {
		return sqlSession.selectOne("Message.geUnreadChat",map);
	}
	
}