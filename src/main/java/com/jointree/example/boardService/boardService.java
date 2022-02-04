package com.jointree.example.boardService;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import com.jointree.example.Vo.ChatRoom;
import com.jointree.example.Vo.FileInfoDto;
import com.jointree.example.Vo.adminPage;
import com.jointree.example.Vo.boardVO;
import com.jointree.example.Vo.orderSheet;
import com.jointree.example.Vo.menuinfor;
import com.jointree.example.Vo.myPageVO;

public interface boardService {
	public List<boardVO> list(boardVO board) throws Exception;
	public List<boardVO> uploadlist(boardVO board) throws Exception; //게시물 가져오기
	public void ExcelDown(HttpServletResponse response) throws Exception;
	public int excelUpload(File destfile) throws Exception;
	public void tablereset() throws Exception; // 테이블 초기화
	public List<boardVO> searchall(boardVO board) throws Exception; //전체검색
	public List<boardVO> search(boardVO board) throws Exception; //조건검색
}
