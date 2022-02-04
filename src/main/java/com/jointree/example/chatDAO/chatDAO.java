package com.jointree.example.chatDAO;

import java.util.List;

import com.jointree.example.Vo.ChatRoom;
import com.jointree.example.Vo.FileInfoDto;
import com.jointree.example.Vo.adminPage;
import com.jointree.example.Vo.orderSheet;
import com.jointree.example.Vo.menuinfor;
import com.jointree.example.Vo.myPageVO;



public interface chatDAO {
	public List<ChatRoom> list(ChatRoom vo); // 채팅방 조회
	
	public void create(ChatRoom vo); //채팅방 생성
	
	public ChatRoom findroom(String id); // 채팅방 들어가기
	
	// 채팅방 삭제
	public void delete(String id); 
	
	public List<orderSheet> orderSheet(orderSheet os); //주문서 조회
	
	public int insertorder(orderSheet os); //주문서 작성
	
	public void orderdelete(orderSheet os); //주문 취소
	
	public int ordercount(String roomId); //주문서 개수
	public List<orderSheet> menucount(orderSheet os); //메뉴 개수
	public void menuinfor(ChatRoom vo); //메뉴 정보 입력
	public List<ChatRoom> menulist(String roomId); //메뉴 정보 보기
	public void orderminus (orderSheet os); //메뉴 갯수 줄이기
	public List<menuinfor> menuinforList(String roomId); //해당 방의 메뉴 정보 가져오기
	public void addmenu(menuinfor mf); // 메뉴 추가하기
	public void deletemenu(menuinfor mf); // 메뉴 삭제하기
	public orderSheet firstmenu(orderSheet os); //최근 메뉴 불러오기
	public List<myPageVO> mypage(myPageVO vo); //마이페이지 주문 정보 불러오기
	
	public List<adminPage> adminmenulist(adminPage vo); //회원들이 먹은 음식별 갯수 카운트
	public adminPage adminavgprice(adminPage vo); //회원들의 평균 점심 식대
	public adminPage adminmaxprice(adminPage vo); //가장 비싼 음식의 가격
	public List<adminPage> adminmaxpricename(adminPage vo);//가장 비싼 음식의 이름
	public List<adminPage> adminavgpricelist(adminPage vo);//회원별 점심식사 평균 식대
	
	public void fileupload(FileInfoDto file); //이미지 업로드
	public List<FileInfoDto> imageload(String roomId); //이미지 불러오기
	public FileInfoDto filedownload(String saveFile); //이미지 다운로드
	public void imagedelete(FileInfoDto file);//이미지 삭제
	public void imagechange(FileInfoDto file);//이미지 수정
	
	public void menuchange(menuinfor mf); //메뉴 수정
	public void filemenuchange(menuinfor mf);// 파일 메뉴 수정
	public menuinfor menucount(menuinfor mf); //메뉴 갯수 가져오기
	
	public void dbdelete(orderSheet os); //메뉴수정에서 삭제시 주문서에도 삭제되기
	public void osupdate(orderSheet os); //메뉴수정하면 주문서도 수정되기
	
	public menuinfor menucheck(menuinfor mf); //중복 메뉴 체크하기
	
}
