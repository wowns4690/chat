package com.jointree.example.boardService;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Repository;

import com.jointree.example.Vo.ChatRoom;
import com.jointree.example.Vo.FileInfoDto;
import com.jointree.example.Vo.adminPage;
import com.jointree.example.Vo.boardVO;
import com.jointree.example.Vo.myPageVO;
import com.jointree.example.Vo.orderSheet;
import com.jointree.example.boardDAO.boardDAO;
import com.jointree.example.chatDAO.chatDAO;


@Repository
public class boardServiceImpl implements boardService {
	
	@Inject
	private boardDAO dao;

	@Override
	public List<boardVO> list(boardVO board) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(board);
	}

	@Override
	public void ExcelDown(HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
        List<?> list = dao.excel(map);
        
        try{
            //Excel Down 시작
            Workbook workbook = new HSSFWorkbook();
            //시트생성
            Sheet sheet = workbook.createSheet("게시판");
            
            //행, 열, 열번호
            Row row = null;
            Cell cell = null;
            int rowNo = 0;
            
            // 테이블 헤더용 스타일
            CellStyle headStyle = workbook.createCellStyle();
    
            // 가는 경계선을 가집니다.
            headStyle.setBorderTop(BorderStyle.THIN);
            headStyle.setBorderBottom(BorderStyle.THIN);
            headStyle.setBorderLeft(BorderStyle.THIN);
            headStyle.setBorderRight(BorderStyle.THIN);
    
            // 배경색은 노란색입니다.
            headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
            headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
    
            // 데이터는 가운데 정렬합니다.
            headStyle.setAlignment(HorizontalAlignment.CENTER);
    
            // 데이터용 경계 스타일 테두리만 지정
            CellStyle bodyStyle = workbook.createCellStyle();
            bodyStyle.setBorderTop(BorderStyle.THIN);
            bodyStyle.setBorderBottom(BorderStyle.THIN);
            bodyStyle.setBorderLeft(BorderStyle.THIN);
            bodyStyle.setBorderRight(BorderStyle.THIN);
    
            // 헤더 생성
            row = sheet.createRow(rowNo++);
    
            cell = row.createCell(0);
            cell.setCellStyle(headStyle);
            cell.setCellValue("번호");
    
            cell = row.createCell(1);
            cell.setCellStyle(headStyle);
            cell.setCellValue("이름");
    
            cell = row.createCell(2);
            cell.setCellStyle(headStyle);
            cell.setCellValue("제목");
    
            // 데이터 부분 생성
            for(Object map1 : list) {
                Map<String, Object> mapValue = (Map<String, Object>) map1;
                
                row = sheet.createRow(rowNo++);
                cell = row.createCell(0);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(""+mapValue.get("postId"));
                cell = row.createCell(1);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(""+mapValue.get("postWriter"));
                cell = row.createCell(2);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(""+mapValue.get("postTitle"));
            }
    
            // 컨텐츠 타입과 파일명 지정
            response.setContentType("ms-vnd/excel");
            response.setHeader("Content-Disposition", "attachment;filename=test.xls");
 
            // 엑셀 출력
            workbook.write(response.getOutputStream());
            workbook.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
    }

	@Override
	public List<boardVO> uploadlist(boardVO board) throws Exception {
		// TODO Auto-generated method stub
		return dao.uploadlist(board);
	}

	@Override
	public int excelUpload(File destfile) {
		
		ExcelReadOption excelReadOption = new ExcelReadOption();
		
		excelReadOption.setFilePath(destfile.getAbsolutePath());
		
		excelReadOption.setOutputColumns("A","B","C");
		
		excelReadOption.setStartRow(2);
		
		List<Map<String,String>>excelContent = ExcelRead.read(excelReadOption);
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("excelContent", excelContent);
		String status = "true";
		for(int i = 0; i<excelContent.size(); i++) {
			if(excelContent.get(i).get("A").equals(null) || excelContent.get(i).get("A").equals("")) {
				status = "false";
			}
		}
		try {
			if(status.equals("false")) {
				return 0;
			}else {
				return dao.insertExcel(paramMap);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}

	@Override
	public void tablereset() throws Exception {
		// TODO Auto-generated method stub
		dao.tablereset();
	}

	@Override
	public List<boardVO> searchall(boardVO board) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchall(board);
	}

	@Override
	public List<boardVO> search(boardVO board) throws Exception {
		// TODO Auto-generated method stub
		return dao.search(board);
	}
		
}

