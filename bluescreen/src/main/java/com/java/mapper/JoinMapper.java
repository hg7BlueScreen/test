package com.java.mapper;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Drug;
import com.java.dto.Join;

@Mapper
public interface JoinMapper {

	String idCheck(String id);

	String nicknameCheck(String nickname);

	void insertMember(Join join);

	int selectUno(Join join);

	ArrayList<Drug> selectDrugAll(String today);

	ArrayList<Join> selectMemberAll(String today);

}
