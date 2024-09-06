package com.java.service;

import com.java.dto.Join;

public interface JoinService {

	String idCheck(String id);

	String nickNameOk(String nickName);

	void insertMember(Join join);

	int selectUno(Join join);

	
}
