package com.java.mapper;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Drug;
import com.java.dto.Member;

@Mapper
public interface JoinMapper {

	String idCheck(String id);

	String nicknameCheck(String nickname);

	void insertMember(Member join);

	int selectUno(Member join);

	ArrayList<Drug> selectDrugAll(String today);

	ArrayList<Member> selectMemberAll(String today);
	
	void updateUser(Member member);
	

}
