package com.jointree.example.loginDAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jointree.example.Vo.Member;

@Repository
public class loginDAOImpl implements loginDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.jointree.mappers.login";


	@Override
	public void register(Member vo) throws Exception {
		sql.insert(namespace + ".register", vo);
		
	}

	@Override
	public Member login(Member vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".login", vo);
	}

	@Override
	public Member idcheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".idcheck", id);
	}

	@Override
	public Member passwordcheck(Member vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".PasswordCheck", vo);
	}

	@Override
	public Member findid(Member vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".Findid", vo);
	}

	@Override
	public Member findps(Member vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".Findps", vo);
	}

	@Override
	public void psupdate(Member vo) throws Exception {
		sql.insert(namespace + ".psupdate", vo);
		
	}

	@Override
	public void authStatus(String key) throws Exception {
		sql.update(namespace + ".authStatus", key);
		
	}

	@Override
	public Member emailConfirm(Member vo) throws Exception {
		
		return sql.selectOne(namespace + ".emailConfirm", vo);
		
	}

	@Override
	public Member emailcheck(String mberEmail) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".email", mberEmail);
	}

	@Override
	public Member authKeyConfirm(String authKey) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".authKeyConfirm", authKey);
	}

	@Override
	public void memberupdate(Member vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+ ".memberupdate", vo);
	}

	@Override
	public void updatepassword(Member vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace+ ".updatepassword", vo);
	}

	@Override
	public void deletemember(Member vo) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".deletemember", vo);
	}
}
