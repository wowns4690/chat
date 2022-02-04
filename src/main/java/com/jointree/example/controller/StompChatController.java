package com.jointree.example.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.jointree.example.Vo.ChatMessage;
import com.jointree.example.Vo.ChatMessage.MessageType;
import com.jointree.example.chatService.messageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatController {
	
	private final SimpMessagingTemplate template;
	
	@Inject
	private messageService messageservice;
	
	//채팅방 입장
	@MessageMapping(value = "/chat/enter")
	public void enter(ChatMessage message){
		MessageType type = MessageType.Enter;
		message.setType(type);
		message.setMessage("["+message.getRank()+"]"+message.getWriter()+"님이 입장하셨습니다." );
		template.convertAndSend("/sub/chat/room/" + message.getChatRoomId(), message);
	}
	//채팅방 퇴장
	@MessageMapping(value = "/chat/quit")
	public void quit(ChatMessage message) {
		messageservice.userquit(message);
		MessageType type = MessageType.Quit;
		message.setType(type);
		message.setMessage("["+message.getRank()+"]"+message.getWriter() + "님이 퇴장하셨습니다.");
		template.convertAndSend("/sub/chat/room/" + message.getChatRoomId(), message);
	}
	
	//json정보 받아서 메시지 출력
	@MessageMapping(value = "/chat/message")
	public void message(ChatMessage message){
		MessageType type = MessageType.Talk;	
		message.setType(type);
		message.setMessage("["+message.getRank()+"]"+message.getWriter()+" : "+message.getMessage());
		template.convertAndSend("/sub/chat/room/" + message.getChatRoomId(), message);
	}
	
	//메뉴 선택 메세지
	@MessageMapping(value = "/chat/menu")
	public void menumessage(ChatMessage message) {
		MessageType type = MessageType.Talk;
		message.setType(type);
		message.setMessage("["+message.getRank()+"]"+message.getWriter() + "님이 "+message.getMessage()+"를 선택하셨습니다.");
		template.convertAndSend("/sub/chat/room/" + message.getChatRoomId(), message);
	}
	
	//메뉴 선택
	@MessageMapping(value = "/chat/menuselect")
	public void menuselect(ChatMessage message) {
		MessageType type = MessageType.Select;
		message.setType(type);
		message.setMessage("["+message.getRank()+"]"+message.getWriter()+" : "+message.getMessage());
		template.convertAndSend("/sub/chat/room/" + message.getChatRoomId(), message);
	}
	
	//메뉴 삭제
	@MessageMapping(value = "/chat/menudelete")
	public void menudelete(ChatMessage message) {
		MessageType type = MessageType.Delete;
		message.setType(type);
		template.convertAndSend("/sub/chat/room/" + message.getChatRoomId(), message);
		
	}
	
	

}
