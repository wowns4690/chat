package com.jointree.example.chatService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.jointree.example.Vo.ChatRoom;
import com.jointree.example.Vo.FileInfoDto;
import com.jointree.example.Vo.adminPage;
import com.jointree.example.Vo.myPageVO;
import com.jointree.example.Vo.orderSheet;
import com.jointree.example.chatDAO.chatDAO;


@Repository
public class chatServiceImpl implements chatService {
	
	@Inject
	private chatDAO dao;

	@Override
	public List<ChatRoom> list(ChatRoom vo) {
		
		return dao.list(vo);
	}

	@Override
	public void create(ChatRoom vo) {
		
		dao.create(vo);

	}

	@Override
	public ChatRoom findroom(String id) {
		
		return dao.findroom(id);
	}

	@Override
	public void delete(String id) {
		
		dao.delete(id);
		
	}

	@Override
	public List<orderSheet> orderSheet(orderSheet os) {
		// TODO Auto-generated method stub
		return dao.orderSheet(os);
	}

	@Override
	public int insertorder(orderSheet os) {
		
		return dao.insertorder(os);
		
	}

	@Override
	public void orderdelete(orderSheet os) {
		// TODO Auto-generated method stub
		dao.orderdelete(os);
	}

	@Override
	public int ordercount(String roomId) {
		// TODO Auto-generated method stub
		return dao.ordercount(roomId);
	}

	@Override
	public List<orderSheet> menucount(orderSheet os) {
		// TODO Auto-generated method stub
		return dao.menucount(os);
	}


	@Override
	public void menuinfor(ChatRoom vo) {
		// TODO Auto-generated method stub
		dao.menuinfor(vo);
	}

	@Override
	public List<ChatRoom> menulist(String roomId) {
		// TODO Auto-generated method stub
		return dao.menulist(roomId);
	}

	@Override
	public void orderminus(com.jointree.example.Vo.orderSheet os) {
		// TODO Auto-generated method stub
		dao.orderminus(os);
	}

	@Override
	public List<com.jointree.example.Vo.menuinfor> menuinforList(String roomId) {
		// TODO Auto-generated method stub
		return dao.menuinforList(roomId);
	}

	@Override
	public void addmenu(com.jointree.example.Vo.menuinfor mf) {
		// TODO Auto-generated method stub
		dao.addmenu(mf);
		
	}

	@Override
	public void deletemenu(com.jointree.example.Vo.menuinfor mf) {
		// TODO Auto-generated method stub
		dao.deletemenu(mf);
	}

	@Override
	public com.jointree.example.Vo.orderSheet firstmenu(com.jointree.example.Vo.orderSheet os) {
		// TODO Auto-generated method stub
		return dao.firstmenu(os);
	}

	@Override
	public List<myPageVO> mypage(myPageVO vo) {
		// TODO Auto-generated method stub
		return dao.mypage(vo);
	}

	@Override
	public List<adminPage> adminmenulist(adminPage vo) {
		// TODO Auto-generated method stub
		return dao.adminmenulist(vo);
	}

	@Override
	public adminPage adminavgprice(adminPage vo) {
		// TODO Auto-generated method stub
		return dao.adminavgprice(vo);
	}

	@Override
	public adminPage adminmaxprice(adminPage vo) {
		// TODO Auto-generated method stub
		return dao.adminmaxprice(vo);
	}

	@Override
	public List<adminPage> adminmaxpricename(adminPage vo) {
		// TODO Auto-generated method stub
		return dao.adminmaxpricename(vo);
	}

	@Override
	public List<adminPage> adminavgpricelist(adminPage vo) {
		// TODO Auto-generated method stub
		return dao.adminavgpricelist(vo);
	}

	@Override
	public void fileupload(FileInfoDto file) {
		// TODO Auto-generated method stub
		dao.fileupload(file);
	}

	@Override
	public List<FileInfoDto> imgload(String roomId) {
		// TODO Auto-generated method stub
		return dao.imageload(roomId);
	}

	@Override
	public FileInfoDto filedownload(String saveFile) {
		// TODO Auto-generated method stub
		return dao.filedownload(saveFile);
	}

	@Override
	public void imagedelete(FileInfoDto file) {
		// TODO Auto-generated method stub
		dao.imagedelete(file);
	}

	@Override
	public void imagechange(FileInfoDto file) {
		// TODO Auto-generated method stub
		dao.imagechange(file);
	}

	@Override
	public void menuchange(com.jointree.example.Vo.menuinfor mf) {
		// TODO Auto-generated method stub
		dao.menuchange(mf);
	}

	@Override
	public void filemenuchange(com.jointree.example.Vo.menuinfor mf) {
		// TODO Auto-generated method stub
		dao.filemenuchange(mf);
	}

	@Override
	public com.jointree.example.Vo.menuinfor menucount(com.jointree.example.Vo.menuinfor mf) {
		// TODO Auto-generated method stub
		return dao.menucount(mf);
	}

	@Override
	public void dbdelete(com.jointree.example.Vo.orderSheet os) {
		// TODO Auto-generated method stub
		dao.dbdelete(os);
	}

	@Override
	public void osupdate(com.jointree.example.Vo.orderSheet os) {
		// TODO Auto-generated method stub
		dao.osupdate(os);
	}

	@Override
	public com.jointree.example.Vo.menuinfor menucheck(com.jointree.example.Vo.menuinfor mf) {
		// TODO Auto-generated method stub
		return dao.menucheck(mf);
	}




}
