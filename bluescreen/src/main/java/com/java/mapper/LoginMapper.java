package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.BMember;

@Mapper
public interface LoginMapper {

	BMember selectLogin(String id, String pw);


}
