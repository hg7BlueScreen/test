package com.java.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.java.dto.Caution;
import com.java.dto.Complain;
import com.java.dto.Member;

public interface MemberService {

	ArrayList<Member> selectAllMember(String userCategory, String keyword);

	Member selectOneMember(int uno);

	void setCaution(Caution caution);

	ArrayList<Complain> selectComplainAll();

	void deleteReportOne(int cno);

	Member selectKey(String id);

	String selectUseremail(int uno);

	Timestamp selectLeavedate(int uno);

	ArrayList<Caution> selectcList(int uno);

}
