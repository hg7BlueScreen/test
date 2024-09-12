package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Medicine;

@Mapper
public interface myMapper {

	int selectListCount();

	ArrayList<Medicine> selectAll(int startRow, int endRow);

	String selectaddr(String attribute);

}
