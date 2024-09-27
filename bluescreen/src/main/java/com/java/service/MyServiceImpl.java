package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Drug;
import com.java.dto.Member;
import com.java.dto.Medicine;
import com.java.dto.Page;
import com.java.mapper.MyMapper;

@Service
public class MyServiceImpl implements MyService {
	@Autowired MyMapper mymapper;
	@Override
	public Member selectUser(String attribute) {
		Member selectaddr = mymapper.selectUser(attribute);
		return selectaddr;
	}
	@Override
	public HashMap<String, Object> selectDList(Page page, int uno) {
		//System.out.println(uno);
		page = pageMyMedi(page, uno);
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<Drug> dList = mymapper.selectDList(page, uno);
		
		map.put("page", page);
		map.put("dList", dList);
		return map;
	}

	private Page pageMyMedi(Page pageDto, int uno) {
		// 전체 게시글 수 저장
		pageDto.setListCount(mymapper.selectListCount(uno));
		// 최대 넘버링 페이지
		pageDto.setMaxPage((int) Math.ceil((double) pageDto.getListCount() / 10));
		// 시작 넘버링페이지
		pageDto.setStartPage((int) ((pageDto.getPage() - 1) / 10) * 10 + 1);
		// 끝 넘버링 페이지
		pageDto.setEndPage(pageDto.getStartPage() + 10 - 1);
		// 게시글 시작번호
		pageDto.setStartRow((pageDto.getPage() - 1) * 10 + 1);
		// 게시글 끝나는 번호
		pageDto.setEndRow(pageDto.getStartRow() + 10 - 1);
		return pageDto;
	}
	@Override
	public void deleteCk(int[] dnoNum, int uno) {
		for(int i=0;i<dnoNum.length;i++) {
			mymapper.deleteCk(dnoNum[i], uno);
		}
	}
	
	@Override
	public String myMediAll(int uno, int dno) {
		String result = mymapper.myMediAll(uno, dno);
		//System.out.println(result);
		return result;
	}
	@Override
	public void myMediUp(int uno, int dno, String ddate) {
		mymapper.myMediUp(uno, dno, ddate);
		
	}
	@Override
	public void alarmDate(int uno, String alDate) {
		mymapper.alarmDate(uno, alDate);
		mymapper.alarm_date(uno, alDate);
		
	}
	@Override
	public ArrayList<Medicine> selectMList(int uno) {
		ArrayList<Medicine> mList = mymapper.selectMList(uno);
		return mList;
	}
	


}
