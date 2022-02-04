package com.jointree.example.loginDAO;

import com.jointree.example.Vo.Member;

public interface loginDAO {

		//회원가입
		public void register(Member vo) throws Exception;
		
		//로그인
		public Member login(Member vo) throws Exception;
		
		//아이디 중복확인
		public Member idcheck(String id) throws Exception;
		
		//로그인 비밀번호 체크
		public Member passwordcheck(Member vo) throws Exception;
		
		//아이디 찾기
		public Member findid(Member vo) throws Exception;
		
		//비밀번호 찾기
		public Member findps(Member vo) throws Exception;
		
		//비밀번호 수정
		public void psupdate(Member vo) throws Exception;
		
		//이메일 인증
		public void authStatus(String key) throws Exception;
		
		//이메일 인증 확인
		public Member emailConfirm(Member vo) throws Exception;
		
		//이메일 중복 확인
		public Member emailcheck(String mberEmail) throws Exception;
		
		//인증키 확인
		public Member authKeyConfirm(String authKey) throws Exception;
		
		//회원정보 수정
		public void memberupdate(Member vo) throws Exception;
		
		//마이페이지 비밀번호 수정
		public void updatepassword(Member vo) throws Exception;
		
		//회원탈퇴
		public void deletemember(Member vo) throws Exception;
}
