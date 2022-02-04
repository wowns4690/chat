package com.jointree.example.loginService;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.jointree.example.Vo.Member;
import com.jointree.example.loginDAO.loginDAO;
@Repository
public class loginServiceImpl implements loginService {
	
	@Inject
	private loginDAO dao;

	@Override
	public void register(Member vo) throws Exception {
		dao.register(vo);
		
	}

	@Override
	public Member login(Member vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}

	@Override
	public Member idcheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.idcheck(id);
	}

	@Override
	public Member passwordcheck(Member vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.passwordcheck(vo);
	}

	@Override
	public Member findid(Member vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.findid(vo);
	}

	@Override
	public Member findps(Member vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.findps(vo);
	}

	@Override
	public void psupdate(Member vo) throws Exception {
		dao.psupdate(vo);
		
	}

	@Override
	public void authStatus(String key) throws Exception {
		dao.authStatus(key);
		
	}

	@Override
	public Member emailConfirm(Member vo) throws Exception {

		return dao.emailConfirm(vo);
		
	}

	@Override
	public Member email(String mberEmail) throws Exception {
		// TODO Auto-generated method stub
		return dao.emailcheck(mberEmail);
	}

	@Override
	public Member authKeyConfirm(String authKey) throws Exception {
		// TODO Auto-generated method stub
		return dao.authKeyConfirm(authKey);
	}

	@Override
	public void memberupdate(Member vo) throws Exception {
		// TODO Auto-generated method stub
		dao.memberupdate(vo);
	}

	@Override
	public void updatepassword(Member vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updatepassword(vo);
	}

	@Override
	public void deletemember(Member vo) throws Exception {
		// TODO Auto-generated method stub
		dao.deletemember(vo);
	}

}
