package com.java.service;

import java.security.Timestamp;
import java.sql.Date;
import java.text.SimpleDateFormat;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Join;
import com.java.mapper.JoinMapper;

@Service
public class JoinServiceImpl implements JoinService {
	@Autowired JoinMapper jmapper;
	@Override
	public String idCheck(String id) {
		String idOk = jmapper.idCheck(id);
		return idOk;
	}
	@Override
	public String nickNameOk(String nickName) {
		String nName = jmapper.nickNameOk(nickName);
		return nName;
	}
	@Override
	public void insertMember(Join join) {
		
		jmapper.insertMember(join);
		System.err.println(join);
	}
	@Override
	public int selectUno(Join join) {
		int uno = jmapper.selectUno(join);
		
		return uno;
	}
	

}
