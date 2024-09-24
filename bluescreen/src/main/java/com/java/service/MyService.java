package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.java.dto.Drug;
import com.java.dto.Join;
import com.java.dto.Medicine;
import com.java.dto.Page;

public interface MyService {


	Join selectUser(String attribute);

	HashMap<String, Object> selectPage(Page pageDto);

	ArrayList<Drug> selectDList(int uno);

	void deleteCk(int[] dnoNum, int uno);

	void myMediUp(int uno, int dno, String ddate);

	String myMediAll(int uno, int dno);

	void alramDate(int uno, String alDate);

	ArrayList<Medicine> selectMList(int uno);


	

}
