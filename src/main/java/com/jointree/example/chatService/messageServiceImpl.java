package com.jointree.example.chatService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.jointree.example.Vo.ChatMessage;
import com.jointree.example.chatDAO.messageDAO;

@Repository
public class messageServiceImpl implements messageService {
	
	@Inject
	private messageDAO dao;

	@Override
	public List<ChatMessage> list(ChatMessage cm) {
		// TODO Auto-generated method stub
		return dao.list(cm) ;
	}

	@Override
	public void userenter(ChatMessage cm) {
		// TODO Auto-generated method stub
		dao.userenter(cm);
	}

	@Override
	public void userquit(ChatMessage cm) {
		// TODO Auto-generated method stub
		dao.userquit(cm);
	}

}
