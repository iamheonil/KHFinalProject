package com.privateplaylist.www.teacher.chat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.Message;
import com.privateplaylist.www.teacher.chat.dao.ChatDao;

@Service
public class ChatService {
	
	@Autowired
	private ChatDao chatDao;
	
	
	//채팅내역 전체출력
		public List<Message> getChatListById(String fromID,String toID,String chatID){
			Map<String,String> param=new HashMap<String,String>();
			param.put("fromID", fromID);
			param.put("toID",toID);
			param.put("chatID",chatID);
			
			return chatDao.getChatListById(param);
		}
		
		//최근 채팅내역 몇개반 가져옴(cnt 수 만큼)
		public List<Message> getChatListByRecent(String fromID,String toID,int cnt){
			Map<String,Object> param=new HashMap<String,Object>();
			param.put("fromID", fromID);
			param.put("toID",toID);
			param.put("cnt",cnt);
			
			return chatDao.getChatListByRecent(param);
		}
			
		//메시지를 보내는 메서드
		public int submit(Message chat) {
			return chatDao.submit(chat);
		}
		
		//메시지 읽었는지 체크
		public int readChat(String fromID,String toID) {
			Map<String,String> param=new HashMap<String,String>();
			param.put("fromID", fromID);
			param.put("toID",toID);
			
			return chatDao.readChat(param);
		}
		
		//읽지 않았는지 메시지의 수 가쳐오기
		public int getAllUnreadChat(String userID) {
			return chatDao.getAllUnreadChat(userID);
		}
		
		public List<Message> getBox(String userID){
			List<Message> chatBox=chatDao.getBox(userID);
			
			for (int i = 0; i < chatBox.size(); i++) {
				Message x=chatBox.get(i);
				for (int j = 0; j < chatBox.size(); j++) {
					Message y=chatBox.get(j);
					if((x.getFromID()).equals(y.getToID()) && (x.getToID()).equals(y.getFromID())) {
						if(x.getChatID()<y.getChatID()) {
							chatBox.remove(x);
							i--;
							break;
						}else {
							chatBox.remove(y);
							j--;
							break;
						}
					}
				}
			}
			for (Message Message : chatBox) {
				
			}
			System.out.println("");
			return chatBox;
			
		}
		
		public int getUnreadMessage(String fromId,String toId) {
			Map<String,String> userMap=new HashMap<String,String>();
			
			userMap.put("fromId", fromId);
			userMap.put("toId", toId);
			return chatDao.geUnreadChat(userMap);
		}
	
	

}
