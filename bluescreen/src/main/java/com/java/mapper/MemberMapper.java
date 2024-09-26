package com.java.mapper;

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

}
