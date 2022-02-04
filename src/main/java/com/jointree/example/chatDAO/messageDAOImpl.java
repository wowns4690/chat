package com.jointree.example.chatDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jointree.example.Vo.ChatMessage;

@Repository
public class messageDAOImpl implements messageDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.jointree.mappers.Message";

	@Override
	public List<ChatMessage> list(ChatMessage cm) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".userlist", cm);
	}

	@Override
	public void userenter(ChatMessage cm) {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".userenter", cm);

	}

	@Override
	public void userquit(ChatMessage cm) {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".userquit", cm);
	}

}
