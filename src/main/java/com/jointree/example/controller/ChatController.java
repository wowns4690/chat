package com.jointree.example.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.fasterxml.jackson.core.JsonParser;
import com.jointree.example.Vo.ChatMessage;
import com.jointree.example.Vo.ChatRoom;
import com.jointree.example.Vo.FileInfoDto;
import com.jointree.example.Vo.Member;
import com.jointree.example.Vo.adminPage;
import com.jointree.example.Vo.menuinfor;
import com.jointree.example.Vo.myPageVO;
import com.jointree.example.Vo.orderSheet;
import com.jointree.example.Vo.ChatMessage.MessageType;
import com.jointree.example.chatService.chatService;
import com.jointree.example.chatService.messageService;

@Controller
@RequestMapping("/websocket/*")
public class ChatController {
	
	@Inject
	private chatService chatservice;
	@Inject
	private messageService messageservice;
	
	private static String realPath = "D:/upload";
	private static String copyPath = "D:/upload/Delete";
	
	
	//채팅방 목록
	 @RequestMapping(value="/rooms" , method= {RequestMethod.GET,RequestMethod.POST})
	    public String rooms(Model model, ChatRoom vo, HttpSession session) throws Exception{
		 	if(session.getAttribute("id") == null) {
		 		return "redirect:/login/loginView";
		 	}else {
		 		LocalDate now = LocalDate.now();
		 		vo.setChatDate(now.toString());
		 		List<ChatRoom> list = chatservice.list(vo);
		        model.addAttribute("rooms",list); 
		        model.addAttribute("name",session.getAttribute("id").toString());
		        model.addAttribute("mberName",session.getAttribute("name").toString());
		        return "websocket/rooms";
		 	}
	    }
	 //채팅방
	 @RequestMapping(value="/room" , method= {RequestMethod.GET,RequestMethod.POST})
	    public String room(String id, Model model, HttpSession session, orderSheet os,
	    		ChatMessage cm){
		 	LocalDate now = LocalDate.now();
		 	//접속자 정보 저장하기
		 	MessageType type = MessageType.UserEnter;
		 	cm.setChatRoomId(id);
		 	cm.setMberId(session.getAttribute("id").toString());
		 	cm.setMessage("접속");
		 	cm.setRank(session.getAttribute("rank").toString());
		 	cm.setType(type);
		 	cm.setWriter(session.getAttribute("name").toString());
		 	messageservice.userenter(cm);
		 	//주문서 보여주기
		 	os.setRoomId(id);
		 	os.setOrderDate(now.toString());
		 	List<orderSheet> orderSheet = chatservice.orderSheet(os);
		 	//룸입장하기	
		 	ChatRoom room = chatservice.findroom(id);
		 	List<ChatRoom> menu = chatservice.menulist(id);
		 	
		 	//이미지 정보 불러오기
		 	List<FileInfoDto> file = chatservice.imgload(id);
		 	 
		 	for(int i = 0; i<file.size(); i++) {
		 		if(file.get(i).getUseYn().equals("N")) {
		 			file.remove(i);
		 			i= -1;
		 		}
		 	}
		 	
		 	
		 	model.addAttribute("menu", menu);
		 	model.addAttribute("mberName",session.getAttribute("name").toString());
	        model.addAttribute("name", session.getAttribute("name").toString());
	        model.addAttribute("rank", session.getAttribute("rank").toString());
	        model.addAttribute("mberId", session.getAttribute("id").toString());
	        model.addAttribute("room",room);
	        model.addAttribute("orderSheet",orderSheet);
	        model.addAttribute("file", file);
	        
	        return "websocket/room";
	    }
	 
	 //채팅방 만들기(View)
	 @RequestMapping(value="/new" , method= {RequestMethod.GET,RequestMethod.POST})
	    public String make(Model model, HttpSession session){
	        ChatRoomForm form = new ChatRoomForm();
	        model.addAttribute("form",form);
	        model.addAttribute("mberName",session.getAttribute("name").toString());
	        model.addAttribute("cadress", session.getAttribute("cadress"));
	        model.addAttribute("mberName", session.getAttribute("name"));
	        model.addAttribute("mberId", session.getAttribute("id").toString());
	        return "websocket/newRoom";
	    }
	 
	 //채팅방 만들기(function)
		 @RequestMapping(value="/newroom" , method= {RequestMethod.GET,RequestMethod.POST})
		    public String makeRoom(ChatRoom vo, HttpSession session,
		    		String storeinfo,Model model, HttpServletRequest req ) throws ParseException, IllegalStateException, IOException{
			 	MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
			 	LocalDate now = LocalDate.now();
		        String roomid = UUID.randomUUID().toString();
		        JSONParser parser = new JSONParser();
		        JSONObject info = (JSONObject)parser.parse(storeinfo);
		        String saveFolder = realPath + File.separator + roomid;
		        File folder = new File(saveFolder);
		        vo.setRmd(roomid);
		        
		        MultipartFile files[] = new MultipartFile[multipartRequest.getFileMap().size()];
		        for(int i = 0; i<multipartRequest.getFileMap().size(); i++) {
		        files[i] = multipartRequest.getFile("upfilename"+(i+1));
		        }
		       
		        String menu[] = vo.getMenu().split(",");
		        String menuprice[] = vo.getMenuprice().split(",");
		        for(int i = 0; i<menu.length; i++) {
		        	vo.setMenu(menu[i]);
		        	vo.setMenuprice(menuprice[i]);
		        	chatservice.menuinfor(vo);
		        }
		        
		        
		        
		        if(!folder.exists())
		        	folder.mkdirs();
		        List<FileInfoDto> fileInfos = new ArrayList<FileInfoDto>();
		        int num = 1;
				        for(MultipartFile mfile : files) {
				        	FileInfoDto fileInfoDto = new FileInfoDto();
				        	String originalFileName = mfile.getOriginalFilename();
				        	if(!originalFileName.isEmpty()) {
				        		String saveFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.lastIndexOf('.'));
				        		fileInfoDto.setSaveFolder(roomid);
				        		fileInfoDto.setOriginFile(originalFileName);
				        		fileInfoDto.setSaveFile(saveFileName);
				        		fileInfoDto.setRoomId(roomid);
				        		fileInfoDto.setUploadNum(num);
				        		fileInfoDto.setMenu(menu[num-1]);
				        		num++;
				        		mfile.transferTo(new File(folder, saveFileName));
				        	}else {
				        		originalFileName = null;
				        		String saveFileName = null;
				        		fileInfoDto.setSaveFolder(roomid);
				        		fileInfoDto.setOriginFile(originalFileName);
				        		fileInfoDto.setSaveFile(saveFileName);
				        		fileInfoDto.setRoomId(roomid);
				        		fileInfoDto.setUploadNum(num);
				        		fileInfoDto.setMenu(menu[num-1]);
				        		num++;
				        	}
				        	fileInfos.add(fileInfoDto);
				        	chatservice.fileupload(fileInfoDto);
				        	
				        }
		        
		        vo.setRoomMaster(session.getAttribute("name").toString());
		        vo.setMasterRank(session.getAttribute("rank").toString());
		        vo.setRoomMasterId(session.getAttribute("id").toString());
		        vo.setStoreAdress(info.get("address_name").toString());
		        vo.setStoreName(info.get("place_name").toString());
		        vo.setStoreRoadAdress(info.get("road_address_name").toString());
		        vo.setStoreX(info.get("x").toString());
		        vo.setStoreY(info.get("y").toString());
		        vo.setStoreUrl(info.get("place_url").toString());
		        vo.setChatDate(now.toString());
		        vo.setUseYn("Y");
		        
		        chatservice.create(vo);
		        model.addAttribute("cAdress", session.getAttribute("cadress"));
		        return "redirect:room?id="+roomid;
		    }
		 
	 //채팅방 삭제하기
	 @RequestMapping(value="/delete" , method= {RequestMethod.GET,RequestMethod.POST})
	    public String delete(Model model, String id){
	        chatservice.delete(id);
	        
	        return "redirect:rooms";
	    }
	 
	 //주문서 작성하기
	 @RequestMapping(value="/insertorderSheet" , method= {RequestMethod.GET,RequestMethod.POST})
	 @ResponseBody
	    public String insertorderSheet(HashMap<Object,String> params,Model model, String roomId, orderSheet os){
		 	
		 	
		 	
		 	chatservice.insertorder(os);
		 	
		 	
		 	return null;
	    }
	 
	 
	//주문서 삭제하기
	@RequestMapping(value="/deleteorderSheet" , method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String deleteorderSheet(Model model, String roomId, String order, orderSheet os){
		chatservice.orderdelete(os);
		
		return null;
	}
	
	//주문서 하나씩 삭제하기
	@RequestMapping(value="/orderminus" , method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String orderminus(orderSheet os, orderSheet os2){
		os2 = chatservice.firstmenu(os);
		os.setFirstmenu(os2.getFirstmenu());
		chatservice.orderminus(os);
			
		return null;
	}
	
	
	//메뉴 개수 조회
	@RequestMapping(value="/menuCount" , method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<orderSheet> menucount(Model model, String roomId, orderSheet os, menuinfor mf){
		LocalDate now = LocalDate.now();
		int i = 0;
		int total = 0;
		os.setRoomId(roomId);
		os.setOrderDate(now.toString());
		List<orderSheet> menucount = chatservice.menucount(os);
		for(i = 0; i<menucount.size(); i++) {
			total = total + (menucount.get(i).getOrdercount() * menucount.get(i).getMenuprice());
		}
		model.addAttribute("menuprice", total);
		return menucount;
	}	
	
	//접속자 조회
	@RequestMapping(value="/userQuit" , method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<ChatMessage> userQuit(@RequestParam HashMap<String , Object> params , ChatMessage cm, Model model){
		
		//접속자 목록 보여주기
		cm.setChatRoomId(params.get("chatRoomId").toString());
		cm.setMberId(params.get("mberId").toString());
	 	List<ChatMessage> userList = messageservice.list(cm);
	 	
		return userList;
	}
	 
	//헤더 페이지
	@RequestMapping(value = "/header", method = {RequestMethod.GET,RequestMethod.POST})
	public String headerPage(Model model , Member member, HttpSession session) {
		
		model.addAttribute("mberName", session.getAttribute("name"));
		model.addAttribute("rank", session.getAttribute("rank"));
		
		return null;
	}
	
	//메뉴 수정페이지(View)
		 @RequestMapping(value="/menuupdate" , method= {RequestMethod.GET,RequestMethod.POST})
		    public String menuupdate(String roomId, Model model, menuinfor mf){
		        List<menuinfor> menuList = chatservice.menuinforList(roomId);
		        for(int i = 0; i<menuList.size(); i++) {
		        	menuList.get(i).setMenucount(i);
		        }
		        List<FileInfoDto> file = chatservice.imgload(roomId);
		        for(int i = 0; i<file.size(); i++) {
		        	if(file.get(i).getUseYn().equals("N")) {
		        		file.remove(i);
		        		i = -1;
		        	}
		        }
		        model.addAttribute("file", file);
		        model.addAttribute("menu", menuList);
		        model.addAttribute("roomId", roomId);
		        return "websocket/menuupdate";
		    }
		 
		//메뉴 추가기능
		 @RequestMapping(value="/addmenu" , method= {RequestMethod.GET,RequestMethod.POST})
		 @ResponseBody
		    public String addmenu(menuinfor mf, HttpServletRequest req, FileInfoDto fileInfo) throws Exception{
			 	List<FileInfoDto> files = chatservice.imgload(mf.getRoomId());
			 	menuinfor menucheck = chatservice.menucheck(mf);
			 	if(menucheck != null) {
			 		String msg = "fail";
			 		return msg;
			 	}else {
			 		int uploadNum = 0;
				 	for(int i = 0; i<files.size(); i++) {
				 		if(files.get(i).getUploadNum()>uploadNum) {
				 			uploadNum = files.get(i).getUploadNum();
				 		}
				 	}
				 	uploadNum++;
				 	MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
				 	MultipartFile file = multipartRequest.getFile("imageadd");
				 	if(!(file==null)) {
				 		String saveFolder = realPath+"/"+mf.getRoomId();
					 	String originFile = file.getOriginalFilename();
					 	String saveFile = UUID.randomUUID().toString() + originFile.substring(originFile.lastIndexOf("."));
					 	File folder = new File(saveFolder);
					 	
					 	fileInfo.setMenu(mf.getMenu());
					 	fileInfo.setOriginFile(originFile);
					 	fileInfo.setRoomId(mf.getRoomId());
					 	fileInfo.setSaveFile(saveFile);
					 	fileInfo.setSaveFolder(mf.getRoomId());
					 	fileInfo.setUploadNum(uploadNum);
					 	file.transferTo(new File(folder,saveFile));
				 	}else {
				 		fileInfo.setUploadNum(uploadNum);
				 		fileInfo.setSaveFolder(mf.getRoomId());
				 	}
				 	
				 	chatservice.fileupload(fileInfo);
			        chatservice.addmenu(mf);
			        String msg = "success";
			        return msg;
			 	}
			 	
		    }
	
		//메뉴 삭제기능
		 @RequestMapping(value="/deletemenu" , method= {RequestMethod.GET,RequestMethod.POST})
		 @ResponseBody
		    public String deletemenu(String roomId, Model model, menuinfor mf, FileInfoDto file, orderSheet os) throws Exception{
			 	String filePath = realPath+"/"+roomId+"/"+file.getSaveFile();
			 	String fileCopy = copyPath+"/"+file.getSaveFile();
			 	File copyFilein = new File(filePath);
			 	File copyFileout = new File(fileCopy);
			 	menuinfor menu = chatservice.menucount(mf);
			 	int menucount = menu.getMenucount();
			 	if(menucount<2) {
			 		String msg = "fail";
			 		return msg;
			 	}else {
			 		if(!file.getSaveFile().isEmpty()) {
					 	if(copyFilein.exists()) {
					 		FileCopyUtils.copy(copyFilein, copyFileout);
					 	}
					 	
					 	File deleteFile = new File(filePath);
					 	if(deleteFile.exists()) {
					 		deleteFile.delete();
					 		}
					 	}
				        chatservice.deletemenu(mf);
				        chatservice.imagedelete(file);
				        chatservice.dbdelete(os);
				        String msg = "success";
				        return msg;
			 	}
		        
		    }
		 
		 //이미지 수정
		 @RequestMapping(value="/imagechange" , method= {RequestMethod.GET,RequestMethod.POST})
		 @ResponseBody
		 public String imagechange(FileInfoDto file, HttpServletRequest req, menuinfor mf, orderSheet os) throws Exception {
			 MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
			 MultipartFile changefile = multipartRequest.getFile("file");
			 String saveFolder = realPath+"/"+file.getRoomId();
			 String originalFile = changefile.getOriginalFilename();
			 String saveFile = UUID.randomUUID().toString() + originalFile.substring(originalFile.lastIndexOf("."));
			 File deleteFile = new File(saveFolder+"/"+file.getSaveFile());
			 File folder = new File(saveFolder);
			 
			 file.setChangeFile(saveFile); // 바꿀 파일의 저장 이름
			 file.setOriginFile(originalFile); // 바꿀 파일의 진짜 이름
			 file.setMenu(mf.getChangemenu());
			 chatservice.imagechange(file);
			 chatservice.menuchange(mf);
			 chatservice.osupdate(os);
			 if(!file.getSaveFile().isEmpty()) {
				 if(deleteFile.exists()) {
					 deleteFile.delete(); 
				 }
			 }
			 changefile.transferTo(new File(folder,saveFile));
			 String msg = "success";
			return msg;
		 }
		 
		 //메뉴 수정
		 @RequestMapping(value="/menuchange" , method= {RequestMethod.GET,RequestMethod.POST})
		 @ResponseBody
		 public String menuchange(menuinfor mf, orderSheet os)throws Exception{
			 
			 chatservice.osupdate(os);
			 chatservice.filemenuchange(mf);
			 chatservice.menuchange(mf);
			 return null;
		 }
		 
		 
		 //마이페이지(View)
		 @RequestMapping(value="/mypage" , method= {RequestMethod.GET,RequestMethod.POST})
		 public String myPage(HttpSession session, Model model, myPageVO vo, String startpage, String roomId) {
			 LocalDate now = LocalDate.now();
			 vo.setYear(now.getYear());
			 if(vo.getMonth()==0) {
			 vo.setMonth(now.getMonthValue());
			 } 
			 vo.setMberId(session.getAttribute("id").toString());
			 List<myPageVO> mypage = chatservice.mypage(vo);
			 int i = 0;
			 //가장 많이 먹은 음식과 횟수 구하기
			 int sum = 0;
			 String menu = "";
			 String storeName = "";
			 for(i = 0; i<mypage.size(); i++) {
				 if(mypage.get(i).getOrdercount()>sum) {
					 sum = mypage.get(i).getOrdercount();
					 menu = mypage.get(i).getMenu();
					 storeName = mypage.get(i).getStoreName();
				 }
			 }
			 //한달동안의 식비 구하기
			 int pricesum = 0;
			 for(i = 0; i<mypage.size(); i++) {
				 pricesum += (mypage.get(i).getMenuprice()*mypage.get(i).getOrdercount());
			 }
			 //이번달 날짜별 먹은 음식 구하기
			 String menuarr[] = new String[mypage.size()];
			 for(i=0; i<mypage.size(); i++) {
				 menuarr[i] = mypage.get(i).getOrderDate()+"일 "+mypage.get(i).getStoreName()+"에서 "+mypage.get(i).getMenu();
			 }
			 
			 int ordersum = 0;
			 for(i = 0; i<mypage.size(); i++) {
				 ordersum += mypage.get(i).getOrdercount();
			 }
			 
			 if(ordersum == 0) {
				 model.addAttribute("avgPrice",0);
			 }else {
				 model.addAttribute("avgPrice",pricesum/ordersum); 
			 }
			 model.addAttribute("roomId", roomId);
			 model.addAttribute("startpage", startpage);
			 model.addAttribute("test", mypage);
			 model.addAttribute("monthMenuList", menuarr);
			 model.addAttribute("nowmonth", vo.getMonth());
			 model.addAttribute("storeName", storeName);
			 model.addAttribute("monthprice", pricesum);
			 model.addAttribute("famenu", menu);
			 model.addAttribute("menucount", sum);
			 model.addAttribute("mberId", session.getAttribute("id"));
			 model.addAttribute("mberName", session.getAttribute("name"));
			 
			 return "websocket/myPage";
		 }
		 
		//월 바꾸기
			@RequestMapping(value="/monthchange" , method= {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public List<myPageVO> monthchange(myPageVO vo, HttpSession session){
				LocalDate now = LocalDate.now();
				vo.setYear(now.getYear());
				vo.setMberId(session.getAttribute("id").toString());
				List<myPageVO> mypage = chatservice.mypage(vo);
				 
				return mypage;
			}
		 //월 총합 구하기
			@RequestMapping(value="/monthresult" , method= {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public myPageVO monthresult(myPageVO vo, HttpSession session){
				LocalDate now = LocalDate.now();
				vo.setYear(now.getYear());
				vo.setMberId(session.getAttribute("id").toString());
				List<myPageVO> mypage = chatservice.mypage(vo);
				 int i = 0;
				 //가장 많이 먹은 음식과 횟수 구하기
				 int sum = 0;
				 String menu = "";
				 String storeName = "";
				 for(i = 0; i<mypage.size(); i++) {
					 if(mypage.get(i).getOrdercount()>sum) {
						 sum = mypage.get(i).getOrdercount();
						 menu = mypage.get(i).getMenu();
						 storeName = mypage.get(i).getStoreName();
					 }
				 }
				 //한달동안의 식비 구하기
				 int pricesum = 0;
				 for(i = 0; i<mypage.size(); i++) {
					 pricesum += (mypage.get(i).getMenuprice()*mypage.get(i).getOrdercount());
				 }
				 vo.setFamenu(menu);
				 vo.setStoreName(storeName);
				 vo.setMonthprice(pricesum);
				 vo.setMenucount(sum);
				return vo;
			}
			
			//관리자페이지(View)
			 @RequestMapping(value="/adminpage" , method= {RequestMethod.GET,RequestMethod.POST})
			 public String adminPage(adminPage vo, Model model, HttpSession session) throws Exception {
				 if(session.getAttribute("id").equals("webmaster")) {
					 LocalDate now = LocalDate.now();
					 vo.setYear(now.getYear());
					 if(vo.getMonth()==0) {
						 vo.setMonth(now.getMonthValue());
					 }
					 List<adminPage> menuList = chatservice.adminmenulist(vo);
					 adminPage avgPrice = chatservice.adminavgprice(vo);
					 adminPage maxPrice = chatservice.adminmaxprice(vo);
					 vo.setMaxPrice(maxPrice.getMaxPrice());
					 List<adminPage> maxPriceName = chatservice.adminmaxpricename(vo);
					 List<adminPage> avgPriceList = chatservice.adminavgpricelist(vo);
					 
					 model.addAttribute("avgPrice", avgPrice);
					 model.addAttribute("maxPriceName", maxPriceName);
					 model.addAttribute("avgPriceList", avgPriceList);
					 model.addAttribute("menuList", menuList);
					 model.addAttribute("mberList", avgPriceList);
					 model.addAttribute("nowmonth", vo.getMonth());
					 return "websocket/adminpage";
				 }else {
					 return "redirect:rooms";
				 }
			 }
			 
			 @RequestMapping(value="/download" , method= {RequestMethod.GET,RequestMethod.POST})
			 @ResponseBody
			 public void filedownload(String filename, HttpServletResponse response) throws Exception{
				 FileInfoDto fileinfo = chatservice.filedownload(filename);
				 try {
					 String originFileName = URLDecoder.decode(fileinfo.getOriginFile(), "UTF-8");
					 String path = "D:/upload/"+fileinfo.getSaveFolder()+"/"+filename;
					 String onlyFileName = originFileName.substring(originFileName.lastIndexOf("_") + 1);
					 onlyFileName = new String(onlyFileName.getBytes("UTF-8"), "ISO-8859-1");
					 File file = new File(path);
			        	response.setHeader("Content-Disposition", "attachment;filename=" + onlyFileName); // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
			        	
			        	FileInputStream fileInputStream = new FileInputStream(path); // 파일 읽어오기 
			        	OutputStream out = response.getOutputStream();
			        	
			        	int read = 0;
			                byte[] buffer = new byte[1024];
			                while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
			                    out.write(buffer, 0, read);
			                }
				 } catch (Exception e) {
					
				 }
			 }
			 
			 
}
