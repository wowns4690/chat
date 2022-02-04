package com.jointree.example.chatDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jointree.example.Vo.ChatRoom;
import com.jointree.example.Vo.FileInfoDto;
import com.jointree.example.Vo.adminPage;
import com.jointree.example.Vo.myPageVO;
import com.jointree.example.Vo.orderSheet;

@Repository
public class chatDAOImpl implements chatDAO {
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.jointree.mappers.Chat";

	@Override
	public List<ChatRoom> list(ChatRoom vo) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".chatlist", vo);
	}

	@Override
	public void create(ChatRoom vo) {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".createroom", vo);
	}

	@Override
	public ChatRoom findroom(String id) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".findchatid", id);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		sql.update(namespace + ".deleteroom", id);
	}

	@Override
	public List<orderSheet> orderSheet(orderSheet os) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".orderSheet", os);
	}

	@Override
	public int insertorder(orderSheet os) {
		// TODO Auto-generated method stub
		return sql.insert(namespace + ".insertorderSheet", os);
	}

	@Override
	public void orderdelete(orderSheet os) {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".deleteorderSheet", os);
	}

	@Override
	public int ordercount(String roomId) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".count", roomId);
	}

	@Override
	public List<orderSheet> menucount(orderSheet os) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".orderCount", os);
	}

	@Override
	public void menuinfor(ChatRoom vo) {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".menuinfor", vo);
		
	}

	@Override
	public List<ChatRoom> menulist(String roomId) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".menulist", roomId);
	}

	@Override
	public void orderminus(com.jointree.example.Vo.orderSheet os) {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".orderminus", os);
		
	}

	@Override
	public List<com.jointree.example.Vo.menuinfor> menuinforList(String roomId) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".menuinforList", roomId);
	}

	@Override
	public void addmenu(com.jointree.example.Vo.menuinfor mf) {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".addmenu", mf);
		
	}

	@Override
	public void deletemenu(com.jointree.example.Vo.menuinfor mf) {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".deletemenu", mf);
	}

	@Override
	public com.jointree.example.Vo.orderSheet firstmenu(com.jointree.example.Vo.orderSheet os) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".firstmenu", os);
	}

	@Override
	public List<myPageVO> mypage(myPageVO vo) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".myPageOrder" ,vo);
	}

	@Override
	public List<adminPage> adminmenulist(adminPage vo) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".adminmenulist", vo);
	}

	@Override
	public adminPage adminavgprice(adminPage vo) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".adminavgprice",vo);
	}

	@Override
	public adminPage adminmaxprice(adminPage vo) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".adminmaxprice",vo);
	}

	@Override
	public List<adminPage> adminmaxpricename(adminPage vo) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".adminmaxpricename", vo);
	}

	@Override
	public List<adminPage> adminavgpricelist(adminPage vo) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".adminavgpricelist2", vo);
	}

	@Override
	public void fileupload(FileInfoDto file) {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".fileupload", file);
	}

	@Override
	public List<FileInfoDto> imageload(String roomId) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".imageload", roomId);
	}

	@Override
	public FileInfoDto filedownload(String saveFile) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".filedownload", saveFile);
	}

	@Override
	public void imagedelete(FileInfoDto file) {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".deleteimage", file);
	}

	@Override
	public void imagechange(FileInfoDto file) {
		// TODO Auto-generated method stub
		sql.update(namespace + ".imagechange", file);
	}

	@Override
	public void menuchange(com.jointree.example.Vo.menuinfor mf) {
		// TODO Auto-generated method stub
		sql.update(namespace + ".menuchange", mf);
	}

	@Override
	public void filemenuchange(com.jointree.example.Vo.menuinfor mf) {
		// TODO Auto-generated method stub
		sql.update(namespace + ".filemenuchange",mf);
	}

	@Override
	public com.jointree.example.Vo.menuinfor menucount(com.jointree.example.Vo.menuinfor mf) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".menucount" ,mf);
	}

	@Override
	public void dbdelete(com.jointree.example.Vo.orderSheet os) {
		// TODO Auto-generated method stub
		
		sql.update(namespace + ".deletemenu2", os);
	}

	@Override
	public void osupdate(com.jointree.example.Vo.orderSheet os) {
		// TODO Auto-generated method stub
		
		sql.update(namespace + ".osupdate", os);
	}

	@Override
	public com.jointree.example.Vo.menuinfor menucheck(com.jointree.example.Vo.menuinfor mf) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".menucheck", mf);
	}


	
	

}
