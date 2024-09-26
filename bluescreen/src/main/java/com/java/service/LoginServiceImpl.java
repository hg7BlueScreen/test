package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.BMember;
import com.java.mapper.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired LoginMapper loginmapper;

	@Override
	public BMember selectLogin(String id, String pw) {
		BMember member = loginmapper.selectLogin(id, pw);
		System.out.println(member);
		return member;
	}
	

}
