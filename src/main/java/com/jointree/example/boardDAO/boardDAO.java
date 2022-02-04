package com.jointree.example.boardDAO;

import java.util.List;
import java.util.Map;

import com.jointree.example.Vo.ChatRoom;
import com.jointree.example.Vo.FileInfoDto;
import com.jointree.example.Vo.adminPage;
import com.jointree.example.Vo.boardVO;
import com.jointree.example.Vo.orderSheet;
import com.jointree.example.Vo.menuinfor;
import com.jointree.example.Vo.myPageVO;



public interface boardDAO {
	
	public List<boardVO> list(boardVO board) throws Exception; //게시물 가져오기
	public List<boardVO> uploadlist(boardVO board) throws Exception; //게시물 가져오기
	public List<boardVO> excel(Map<String, Object> map) throws Exception; //엑셀 다운로드
	public int insertExcel(Map<String,Object> paramMap) throws Exception; //엑셀 업로드
	public void tablereset() throws Exception; // 테이블 초기화
	public List<boardVO> searchall(boardVO board) throws Exception; //전체검색
	public List<boardVO> search(boardVO board) throws Exception; //조건검색
	
}
