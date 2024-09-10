package com.java.service;

import com.java.dto.Join;

public interface JoinService {

	String idCheck(String id);

	String nicknameCheck(String nickname);

	void insertMember(Join join);

	int selectUno(Join join);

	String getCode(String name, String email);

	
}
