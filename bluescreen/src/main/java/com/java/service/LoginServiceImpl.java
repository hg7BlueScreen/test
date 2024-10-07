package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.BMember;
import com.java.mapper.LoginMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired LoginMapper loginmapper;
	@Autowired HttpSession session;

	@Override
	public BMember selectLogin(String id, String pw) {
		BMember member = loginmapper.selectLogin(id, pw);
		System.out.println(member);
		return member;
	}

	@Override
	public int ajaxLogin(BMember bm) {
		int result = 0; 
		BMember bmdto = loginmapper.ajaxLogin(bm);
		// 로그인에 성공하면
		if(bmdto == null) {
			return 0;
		}
		if(bmdto.getId().equals("admin")) {
			session.setAttribute("sessionId", bmdto.getId());
			System.out.println(bmdto.getId());
			session.setAttribute("sessionName", bmdto.getName());
			session.setAttribute("sessionUno", bmdto.getUno());
			session.setAttribute("addr", bmdto.getAddress());
			result = 2;
		}else if(bmdto!=null) {
			session.setAttribute("sessionId", bmdto.getId());
			System.out.println(bmdto.getId());
			session.setAttribute("sessionName", bmdto.getName());
			session.setAttribute("sessionUno", bmdto.getUno());
			session.setAttribute("addr", bmdto.getAddress());
			// result에 값 넣기 
			result = 1; 
		}
		return result;
	}
	
	

}
