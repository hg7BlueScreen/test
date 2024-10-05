package com.java.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.java.dto.Announce;
import com.java.dto.Drug;
import com.java.dto.Member;
import com.java.dto.Medicine;
import com.java.dto.Page;

public interface MyService {


	Member selectUser(String attribute);

	HashMap<String, Object> selectDList(Page pageDto, int uno);

	void deleteCk(int[] dnoNum, int uno);

	void myMediUp(int uno, int dno, String ddate);

	String myMediAll(int uno, int dno);

	void alarmDate(int uno, String alDate);

	ArrayList<Medicine> selectMList(int uno);

	Timestamp selectDate();

	void insertAnnounce(Announce announce);

	HashMap<String, Object> selectAllAnnounce(Page page);

	Announce selectOneAnnounce(int ano);

	void adelete(int ano);

	HashMap<String, Object> selectAnnounceOne(int ano);

}
