package com.jointree.example.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jointree.example.Vo.Member;
import com.jointree.example.loginService.loginService;
import com.jointree.example.mail.MailHandler;
import com.jointree.example.mail.TempKey;
import com.jointree.example.session.SessionConfig;


@Controller
@RequestMapping("/login/*")
public class LoginController {
	
	@Inject
	private loginService loginservice;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	//로그인 페이지
	@RequestMapping(value = "/loginView", method = {RequestMethod.POST,RequestMethod.GET})
	public String login() throws Exception{
		return "login/login";
	}
	
	//로그인 기능
	@RequestMapping(value = "/login", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String login(Member vo,HttpSession session,Model model) throws Exception {
		
		String id = vo.getMberId();
		
		Member login = loginservice.login(vo);
		
			if(login == null) {
				Member idcheck = loginservice.idcheck(id);
				if(idcheck == null) {
					String msg = "id";
					model.addAttribute("msg", "idfalse");
					return msg;
				}else {
					Member pscheck = loginservice.passwordcheck(vo);
					if(pscheck == null) {
						String msg = "ps";
						model.addAttribute("msg","psfalse");
						return msg;
					}
				}
				model.addAttribute("member","");
				
				return "login/login";
				
			}else {
				if(login.getAuthStatus().equals("Y")) {
					String msg = "pass";
					SessionConfig.getSessionidCheck("id", vo.getMberId().toString());
					session.setAttribute("member", login);
					session.setAttribute("name", login.getMberName());
					session.setAttribute("id", login.getMberId());
					session.setAttribute("rank", login.getMberRank());
					session.setAttribute("cadress", login.getCAdress());
				return msg;
				}else {
					String msg = "email";
					model.addAttribute("msg", "emailfalse");
					model.addAttribute("member","");
					return msg;
				}
			}
	}
	//로그아웃 세션값 초기화
	@RequestMapping(value = "/logout", method = {RequestMethod.POST,RequestMethod.GET})
	public String logout(String id, HttpSession session) throws Exception{
		if(session.getAttribute("id").equals(id)) {
			session.invalidate();
			return "login/login";
		}else {
			return "forward:/websocket/rooms";
		}
	}
	
	//중복 로그인시 기존에 로그인되있던 사용자 로그인창으로 보내기
	@RequestMapping(value = "/doublelogin", method = {RequestMethod.POST,RequestMethod.GET})
	public String doublelogin (){
		
		return "login/login";
	}
	
	//회원가입 페이지
	@RequestMapping(value = "/registerView", method = {RequestMethod.POST,RequestMethod.GET})
	public String registerView(String id, Model model) throws Exception {
		if(id != null) {
			Member login = loginservice.idcheck(id);
		if(login == null) {
			model.addAttribute("msg","사용 가능한 아이디입니다.");
			model.addAttribute("id",id);
		}else {
			model.addAttribute("msg","중복된 아이디 입니다.");
			model.addAttribute("id",id);
			}
		
		}
		return "login/register";
	}
	
	//회원가입 기능
	@RequestMapping(value = "/register", method = {RequestMethod.POST,RequestMethod.GET})
	public String register(Member vo, Model model) throws Exception {
		String key = new TempKey().getKey(50, false);
		String email = vo.getMberEmail();
		vo.setAuthStatus("N");
		vo.setAuthKey(key);
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[식사 커뮤니티 이메일 인증]");
        sendMail.setText(new StringBuffer().append("<h1>회원 이메일 인증</h1>")
        		.append("<h2>중복 회원가입 방지용 이메일 인증입니다 아래 링크를 클릭해서 인증을 완료해주세요.</h2>")
                .append("<h3><a href='http://localhost/login/emailConfirm?key="+key+"&mberEmail="+email)
                .append("' target='_blenk'>이메일 인증 확인</a></h3>")
                .toString());
        sendMail.setFrom(vo.getMberEmail(), "관리자");
        sendMail.setTo(vo.getMberEmail());
        sendMail.send();
        loginservice.register(vo);
        
		return "login/login";
	}
	
	//이메일인증페이지
	@RequestMapping(value = "emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String key,String mberEmail,Member vo, Model model) throws Exception {
		vo.setAuthKey(key);
		vo.setMberEmail(mberEmail);
		Member user = loginservice.emailConfirm(vo);
		if(user != null) {
		loginservice.authStatus(key);
		model.addAttribute("mberName", user.getMberName());
		model.addAttribute("mberId", user.getMberId());
		return "login/emailConfirmY";
		}else {
			return "login/emailConfirmN";
		}
	}
	
	
	//아이디 체크 페이지
	@RequestMapping(value = "/idCheckView", method = {RequestMethod.POST,RequestMethod.GET})
	public String idCheckView() throws Exception{
		return "login/idCheck";
	}
	
	//아이디 체크 기능
	@RequestMapping(value = "/idCheck", method = {RequestMethod.POST,RequestMethod.GET})
	public String idCheck(String id, Model model) throws Exception{
		Member check = loginservice.idcheck(id);
		if(check == null) {
			model.addAttribute("msg","true");
			model.addAttribute("id",id);
		}else {
			model.addAttribute("msg","false");
			model.addAttribute("id",id);
		}
		return "login/idCheck";
	}
	
	//이메일 중복확인 페이지
		@RequestMapping(value = "/emailCheckView", method = {RequestMethod.POST,RequestMethod.GET})
		public String emailCheckView() throws Exception{
			return "login/emailCheck";
		}
		
		//이메일 중복확인 기능
		@RequestMapping(value = "/emailCheck", method = {RequestMethod.POST,RequestMethod.GET})
		@ResponseBody
		public Member emailCheck(String mberEmail) throws Exception{
			Member email = loginservice.email(mberEmail);
			
			return email;
		}
	
	//아이디 찾기 페이지
	@RequestMapping(value = "/FindidView", method = {RequestMethod.POST,RequestMethod.GET})
	public String idFindView() throws Exception{
		return "login/Findid";
	}
	
	//아이디 찾기 기능
	@RequestMapping(value = "/Findid", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String idFind(Member vo, Model model, String mberName, String mberEmail) throws Exception{
		vo.setMberEmail(mberEmail);
		vo.setMberName(mberName);
		Member findid = loginservice.findid(vo);
		if(findid != null) {
		String mberId = findid.getMberId();
		String[] arr = mberId.split("");
		String masking = "";
		for(int i = 0; i<=arr.length-1; i++) {
			if(i<4) {
			masking += arr[i];
			}else {
				masking += "*";
			}
		}
		return masking;
		}else {
			String mberId = "Noid";
			return mberId;
		}
	}

	//비밀번호 찾기 페이지
	@RequestMapping(value = "/FindpsView", method = {RequestMethod.POST,RequestMethod.GET})
	public String psFindView() throws Exception{
		return "login/Findps";
	}	
	
	//비밀번호 찾기 기능
	@RequestMapping(value = "/Findps", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String psFind(Member vo, Model model, String psA) throws Exception{
		
		Member findps = loginservice.findps(vo);
		if(findps != null) {
			 MailHandler sendMail = new MailHandler(mailSender);
		        sendMail.setSubject("[식사 커뮤니티 비밀번호 변경]");
		        sendMail.setText(new StringBuffer().append("<h1>비밀번호 변경</h1>")
		        		.append("<h2>아래 링크로 접속해 비밀번호를 변경해주세요.</h2>")
		                .append("<h3><a href='http://localhost/login/psupdateView?mberId="+findps.getMberId()+"&mberEmail="+findps.getMberEmail()+"&authKey="+findps.getAuthKey())
		                .append("' target='_blenk'>비밀번호 변경하기</a></h3>")
		                .toString());
		        sendMail.setFrom(findps.getMberEmail(), "관리자");
		        sendMail.setTo(findps.getMberEmail());
		        sendMail.send();
		        
			String result = "true";
			return result;
		}else {
			String result = "false";
			return result;
		}
	}
	
	//비밀번호 수정 페이지
	@RequestMapping(value = "/psupdateView", method = {RequestMethod.POST,RequestMethod.GET})
	public String psupdateView(String mberId, String mberEmail, String authKey, Model model) throws Exception{
		Member key = loginservice.authKeyConfirm(authKey);
		if(key == null) {
			return "login/psupdatefail";
		}else {
		model.addAttribute("mberId",mberId );
		model.addAttribute("mberEmail",mberEmail );
		model.addAttribute("authKey",authKey );
		return "login/psupdate";
		}
	}
	
	//비밀번호 수정 페이지
	@RequestMapping(value = "/psupdate", method = {RequestMethod.POST,RequestMethod.GET})
	public String psupdate(Member vo, String mberPw, String mberId, String mberEmail, String authKey, Model model) throws Exception{
		String key = new TempKey().getKey(50, false);
		vo.setMberPw(mberPw);
		vo.setMberId(mberId);
		vo.setMberEmail(mberEmail);
		vo.setAuthKey(authKey);
		vo.setNewKey(key);
		loginservice.psupdate(vo);
		
		return "login/psupdate";
	}
	
	//회원정보 페이지 들어가기전 비밀번호 체크(function)
	@RequestMapping(value ="/checkpassword", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String checkpassword(Member vo,String mberPw, HttpSession session) throws Exception {
		vo.setMberId(session.getAttribute("id").toString());
		Member check = loginservice.passwordcheck(vo);
		if(check == null) {
			String msg = "fail";
			return msg;
		}else {
			String msg = "success";
			return msg; 
		}
	}
	
	//회원정보 페이지 들어가기전 비밀번호 체크(view)
	@RequestMapping(value ="/checkpasswordView", method = {RequestMethod.POST,RequestMethod.GET})
	public String checkpassword(String startpage, String roomId, Model model) throws Exception {
		model.addAttribute("startpage",startpage);
		model.addAttribute("roomId",roomId);
		return "login/checkpassword";
	}
	
	//회원정보수정페이지(view)
	@RequestMapping(value ="/memberupdateView", method = {RequestMethod.POST,RequestMethod.GET})
	public String memberupdateView(Member vo, HttpSession session, Model model,String startpage,String roomId) throws Exception {
		vo.setMberId(session.getAttribute("id").toString());
		Member member = loginservice.login(vo);
		if(vo.getMberPw() == null) {
			return "login/checkpassword";
		}else {
		String adress = member.getCAdress();
		model.addAttribute("member", member);
		model.addAttribute("adress", adress);
		model.addAttribute("startpage", startpage);
		model.addAttribute("roomId", roomId);
		return "login/memberupdate";
		}
	}
	
	//회원정보수정페이지(function)
	@RequestMapping(value ="/memberupdate", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String memberupdate(Member vo,HttpSession session,Model model ) throws Exception {
		vo.setMberId(session.getAttribute("id").toString());
		Member email = loginservice.email(vo.getMberEmail().toString());
		String emailid = "";
		if(email == null) {
			emailid = "";
		}else {
			emailid = email.getMberId();
		}
		if(emailid.equals(vo.getMberId()) || email == null) {
			loginservice.memberupdate(vo);
			session.setAttribute("name", vo.getMberName());
			session.setAttribute("rank", vo.getMberRank());
			session.setAttribute("cadress", vo.getCAdress());
			String msg = "success";
			return msg;	
		} else{
			String msg = "email";
			return msg;
		}
	}
	
	//비밀번호 변경 페이지(view)
	@RequestMapping(value ="/updatepasswordView", method = {RequestMethod.POST,RequestMethod.GET})
	public String updatepasswordView(String startpage,String roomId,Model model) throws Exception {
		
		model.addAttribute("startpage", startpage);
		model.addAttribute("roomId", roomId);
		
		return "/login/updatepassword";
			
	}
	
	//비밀번호 변경 페이지(function)
	@RequestMapping(value ="/updatepassword", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String updatepassword(Member vo, HttpSession session) throws Exception{
		vo.setMberId(session.getAttribute("id").toString());
		Member login = loginservice.login(vo);
		if(login == null) {
			String msg = "fail";
			return msg;
		}else {
			loginservice.updatepassword(vo);
			String msg = "success";
			session.invalidate();
			return msg;
		}
		
	}
	
	//회원탈퇴(view)
	@RequestMapping(value ="/deletememberView", method = {RequestMethod.POST,RequestMethod.GET})
	public String deletememberView(String startpage, String roomId, Model model)throws Exception {
		
		
		model.addAttribute("startpage", startpage);
		model.addAttribute("roomId", roomId);
		return "/login/deletemember";
	}
	
	//회원탈퇴(function)
	@RequestMapping(value ="/deletemember", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String deletemember(Member vo, HttpSession session) throws Exception {
		vo.setMberId(session.getAttribute("id").toString());
	    loginservice.deletemember(vo);
	    session.invalidate();
		return null;
	}
	
}
