package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Join;

@Mapper
public interface JoinMapper {

	String idCheck(String id);

	String nicknameCheck(String nickname);

	void insertMember(Join join);

	int selectUno(Join join);

}
