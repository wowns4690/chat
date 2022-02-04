package com.jointree.example.loginService;

import com.jointree.example.Vo.Member;

public interface loginService {
	public void register(Member vo) throws Exception;
	
	public Member login(Member vo) throws Exception;
	
	public Member idcheck(String id) throws Exception;
	
	public Member passwordcheck(Member vo) throws Exception;
	
	public Member findid(Member vo) throws Exception;
	
	public Member findps(Member vo) throws Exception;
	
	public void psupdate(Member vo) throws Exception;
	
	public void authStatus(String key) throws Exception;
	
	public Member emailConfirm(Member vo) throws Exception;
	
	public Member email(String mberEmail) throws Exception;
	
	public Member authKeyConfirm(String authKey) throws Exception;
	
	//회원정보 수정
	public void memberupdate(Member vo) throws Exception;
	
	//마이페이지 비밀번호 수정
	public void updatepassword(Member vo) throws Exception;
	
	//회원탈퇴
	public void deletemember(Member vo) throws Exception;
}
