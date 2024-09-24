package com.java.service;

import java.util.ArrayList;

import com.java.dto.Caution;
import com.java.dto.Member;

public interface MemberService {

	ArrayList<Member> selectAllMember(String userCategory, String keyword);

	Member selectOneMember(int uno);

	void setCaution(Caution caution);

}
