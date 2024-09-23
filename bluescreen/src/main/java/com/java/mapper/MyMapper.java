package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Drug;
import com.java.dto.Join;
import com.java.dto.Medicine;

@Mapper
public interface MyMapper {

	int selectListCount();

	ArrayList<Medicine> selectPage(int startRow, int endRow);

	Join selectUser(String attribute);

	ArrayList<Drug> selectMdList(int uno);

	void deleteCk(int dno, int uno);

	void myMediUp(int uno, int dno, String mdate);

	String myMediAll(int uno, int dno);

	void alramDate(int uno, String alDate);

	
	
}
