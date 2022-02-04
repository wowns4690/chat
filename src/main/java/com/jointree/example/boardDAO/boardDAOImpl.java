package com.jointree.example.boardDAO;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jointree.example.Vo.ChatRoom;
import com.jointree.example.Vo.FileInfoDto;
import com.jointree.example.Vo.adminPage;
import com.jointree.example.Vo.boardVO;
import com.jointree.example.Vo.myPageVO;
import com.jointree.example.Vo.orderSheet;

@Repository
public class boardDAOImpl implements boardDAO {
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.jointree.mappers.Board";

	@Override
	public List<boardVO> list(boardVO board) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".boardlist", board);
	}

	@Override
	public List<boardVO> excel(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".exceldown", map);
	}

	@Override
	public List<boardVO> uploadlist(boardVO board) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".uploadlist",board);
	}

	@Override
	public int insertExcel(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return sql.insert(namespace + ".insertexcel", paramMap);
	}

	@Override
	public void tablereset() throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".tablereset");
	}

	@Override
	public List<boardVO> searchall(boardVO board) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".searchall", board);
	}

	@Override
	public List<boardVO> search(boardVO board) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".search", board);
	}

	


	
	

}
