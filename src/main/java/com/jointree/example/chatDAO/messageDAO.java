package com.jointree.example.chatDAO;

import java.util.List;

import com.jointree.example.Vo.ChatMessage;

public interface messageDAO {
	
	public List<ChatMessage> list(ChatMessage cm); // 접속자 조회
	public void userenter(ChatMessage cm); //접속자 등록
	public void userquit(ChatMessage cm); // 접속자 삭제

}
