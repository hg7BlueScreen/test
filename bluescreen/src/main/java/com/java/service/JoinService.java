package com.java.service;

import com.java.dto.Member;

public interface JoinService {

	String idCheck(String id);

	String nicknameCheck(String nickname);

	void insertMember(Member join);

	int selectUno(Member join);

	String getCode(String name, String email);

	Member selectAll(String id);

	void updateUser(Member member);

	
}
