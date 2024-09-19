package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.java.dto.Join;
import com.java.dto.Medicine;
import com.java.dto.Page;

public interface MyService {


	Join selectUser(String attribute);

	HashMap<String, Object> selectPage(Page pageDto);

	ArrayList<Medicine> selectMdList(int uno);

	void deleteCk(int[] mnoNum, int uno);

	void myMediUp(int uno, int mno);

	String myMediAll(int uno, int mno);


	

}
