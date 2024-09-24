package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Caution;
import com.java.dto.Member;
import com.java.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired MemberMapper memberMapper;

	@Override
	public ArrayList<Member> selectAllMember(String userCategory, String keyword) {
		System.out.println(userCategory);
		System.out.println(keyword);
		ArrayList<Member> memberList = memberMapper.selectAllMember(userCategory, keyword);
		return memberList;
	}

	@Override
	public Member selectOneMember(int uno) {
		Member member = memberMapper.selectOneMember(uno);
		return member;
	}

	@Override
	public void setCaution(Caution caution) {
		memberMapper.setCaution(caution);
	}
	
	
	
	
	
}
