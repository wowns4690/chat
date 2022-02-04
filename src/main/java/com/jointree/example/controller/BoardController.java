package com.jointree.example.controller;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.management.RuntimeErrorException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.spi.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jointree.example.Vo.boardVO;
import com.jointree.example.boardService.boardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
		static Logger logger = org.slf4j.LoggerFactory.getLogger(BoardController.class);
	
		@Inject
		private boardService boardservice;
		
		//게시글 리스트
		 @RequestMapping(value="/postList" , method= {RequestMethod.GET,RequestMethod.POST})
		    public String postlist(boardVO board, Model model) throws Exception{
			 	List<boardVO> boardlist = boardservice.list(board);
			 	List<boardVO>uploadlist = boardservice.uploadlist(board);
			 	model.addAttribute("board", boardlist);
			 	model.addAttribute("upload", uploadlist);
			 	return "board/postList"; 
		    }
		//엑셀 다운로드
		 @ResponseBody
		 @RequestMapping(value="/ExcelDown" , method= {RequestMethod.GET,RequestMethod.POST})
		    public void exceldown(boardVO board, HttpServletResponse response) throws Exception{
			 	boardservice.ExcelDown(response);
		    }
		 
		 @ResponseBody
		 @RequestMapping(value="/excelUploadAjax" , method= {RequestMethod.GET,RequestMethod.POST})
		 public int excelUploadAjax( MultipartHttpServletRequest request)throws Exception {
			 
			 MultipartFile excelFile = request.getFile("excelFile");
			 
			 if(excelFile==null || excelFile.isEmpty()) {
				 throw new RuntimeException("엑셀파일을 선택해 주세요.");
			 }
			 File destFile = new File("D:\\excelupload\\"+excelFile.getOriginalFilename());
			 
			 try {
				 excelFile.transferTo(destFile);
			 }catch (Exception e) {
				 throw new RuntimeException(e.getMessage(),e);
			}
			 boardservice.tablereset();
			 int result = boardservice.excelUpload(destFile);
			 destFile.delete();
			 
			 
			 return result;
		 }
		 
		 @ResponseBody
		 @RequestMapping(value="/search" , method= {RequestMethod.GET,RequestMethod.POST})
			public List<boardVO> search(boardVO board, Model model) throws Exception{
			 	List<boardVO>boardlist = new ArrayList<boardVO>();
			 	List<boardVO>uploadlist = boardservice.uploadlist(board);
			 	if(!(board.getSearchvalue() == null)) {
			 		if(board.getSearchtitle().equals("searchall")) {
			 			boardlist = boardservice.searchall(board);
			 		}else if(board.getSearchtitle().equals("searchnum")) {
			 			board.setSearchtitle("POST_ID");
			 			boardlist = boardservice.search(board);
			 		}else if(board.getSearchtitle().equals("searchtitle")) {
			 			board.setSearchtitle("POST_TITLE");
			 			boardlist = boardservice.search(board);
			 		}else if(board.getSearchtitle().equals("searchwriter")) {
			 			board.setSearchtitle("POST_WRITER");
			 			boardlist = boardservice.search(board);
			 		}
			 	}else {
			 		boardlist = boardservice.list(board);
			 	}
			 	model.addAttribute("board", boardlist);
			 	model.addAttribute("upload", uploadlist);
			 	
			 	return boardlist; 
	}
}
