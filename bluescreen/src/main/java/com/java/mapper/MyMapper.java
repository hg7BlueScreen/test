package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Join;
import com.java.dto.Medicine;

@Mapper
public interface MyMapper {

	int selectListCount();

	ArrayList<Medicine> selectPage(int startRow, int endRow);

	Join selectUser(String attribute);

	ArrayList<Medicine> selectMdList(int uno);

	void deleteCk(int mno, int uno);

	void myMediUp(int uno, int mno);

	String myMediAll(int uno, int mno);

	
	
}
