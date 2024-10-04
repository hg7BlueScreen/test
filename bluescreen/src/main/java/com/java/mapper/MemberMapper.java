package com.java.mapper;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Caution;
import com.java.dto.Complain;
import com.java.dto.Member;

@Mapper
public interface MemberMapper {

	ArrayList<Member> selectAllMember(String userCategory, String keyword);

	Member selectOneMember(int uno);

	void setCaution(Caution caution);

	ArrayList<Complain> selectComplainAll();

	void deleteReportOne(int cno);

	Member selectKey(String id);

	String selectuseremail(int uno);

	Timestamp selectleaveDate(int uno);

	ArrayList<Caution> selectcList(int uno);

}
