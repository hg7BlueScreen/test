package com.java.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Caution;
import com.java.dto.Complain;
import com.java.dto.Member;
import com.java.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired MemberMapper memberMapper;

	@Override
	public ArrayList<Member> selectAllMember(String userCategory, String keyword) {
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

	@Override
	public ArrayList<Complain> selectComplainAll() {
		ArrayList<Complain> list = memberMapper.selectComplainAll();
		return list;
	}

	@Override
	public void deleteReportOne(int cno) {
		memberMapper.deleteReportOne(cno);
	}

	@Override
	public Member selectKey(String id) {
		Member member = memberMapper.selectKey(id);
		
		return member;
	}

	@Override
	public String selectUseremail(int uno) {
		String bEmail = memberMapper.selectuseremail(uno);
		
		return bEmail;
	}

	@Override
	public Timestamp selectLeavedate(int uno) {
		Timestamp Ddate = memberMapper.selectleaveDate(uno);
		return Ddate;
	}

	@Override
	public ArrayList<Caution> selectcList(int uno) {
		ArrayList<Caution> cList = memberMapper.selectcList(uno);
		return cList;
	}
	
	
	
	
	
}