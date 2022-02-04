package com.jointree.example.session;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

import com.jointree.example.controller.LoginController;
import com.jointree.example.loginService.loginService;

public class SessionConfig implements HttpSessionListener{
	
	private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<String, HttpSession>();
	
	//중복 로그인 지우기
	public synchronized static String getSessionidCheck(String type, String compareId) {
		String result = "";
		for( String key : sessions.keySet()) {
			HttpSession value = sessions.get(key);
			if(value != null && value.getAttribute(type) != null && value.getAttribute(type).toString().equals(compareId)) {
				result = key.toString();
			}
		}
		removeSessionForDoubleLogin(result);
		return result;
		
	}
	

	private static void removeSessionForDoubleLogin(String id) {
		if(id != null && id.length() > 0) {
			sessions.get(id).invalidate();
			sessions.remove(id);
		}
		
	}


	@Override
	public void sessionCreated(HttpSessionEvent se) {
		sessions.put(se.getSession().getId(), se.getSession());
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		if(sessions.get(se.getSession().getId()) != null) {
			sessions.get(se.getSession().getId()).invalidate();
			sessions.remove(se.getSession().getId());
		}
		
	}

}
