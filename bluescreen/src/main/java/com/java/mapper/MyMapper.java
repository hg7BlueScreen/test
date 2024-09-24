package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Drug;
import com.java.dto.Join;
import com.java.dto.Medicine;
import com.java.dto.Page;

@Mapper
public interface MyMapper {

	ArrayList<Medicine> selectPage(int startRow, int endRow);

	Join selectUser(String attribute);

	void deleteCk(int dno, int uno);

	void myMediUp(int uno, int dno, String ddate);

	String myMediAll(int uno, int dno);

	void alramDate(int uno, String alDate);

	ArrayList<Medicine> selectMList(int uno);

	ArrayList<Drug> selectDList(Page page, int uno);

	int selectListCount(int uno);

	
	
}
