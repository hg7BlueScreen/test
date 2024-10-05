package com.java.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Announce;
import com.java.dto.Drug;
import com.java.dto.Member;
import com.java.dto.Medicine;
import com.java.dto.Page;
import com.java.mapper.MyMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class MyServiceImpl implements MyService {
	@Autowired MyMapper mymapper;
	@Autowired HttpSession session;
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
	@Override
	public Timestamp selectDate() {
		Timestamp Ddate = mymapper.selectDate();
		int uno = (int)session.getAttribute("sessionUno");
		mymapper.updateDdate(Ddate, uno);
		return Ddate;
	}
	@Override
	public void insertAnnounce(Announce announce) {
		mymapper.insertAnnounce(announce);
	}
	@Override
	public HashMap<String, Object> selectAllAnnounce(Page page) {
		page = pageMethodDrug(page);
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<Announce> list = mymapper.selectAllAnnounce(page);
		map.put("list", list);
		map.put("page", page);
		System.out.println(page.getStartPage());
		System.out.println(page.getEndPage());
		System.out.println(page.getListCount());
		System.out.println(page.getMaxPage());
		System.out.println(page.getPage());
		return map;
	}
	
	private Page pageMethodDrug(Page pageDto) {
		// 전체 게시글 수 저장
		pageDto.setListCount(mymapper.selectListCountAnnounce());
		// 최대 넘버링 페이지
		pageDto.setMaxPage((int) Math.ceil((double) pageDto.getListCount() / 20));
		// 시작 넘버링페이지
		pageDto.setStartPage((int) ((pageDto.getPage() - 1) / 10) * 10 + 1);
		// 끝 넘버링 페이지
		pageDto.setEndPage(pageDto.getStartPage() + 10 - 1);
		// 게시글 시작번호
		pageDto.setStartRow((pageDto.getPage() - 1) * 20 + 1);
		// 게시글 끝나는 번호
		pageDto.setEndRow(pageDto.getStartRow() + 20 - 1);

		return pageDto;
	}
	@Override
	public Announce selectOneAnnounce(int ano) {
		Announce announce = mymapper.selectOneAnnounce(ano);
		return announce;
	}
	@Override
	public void adelete(int ano) {
		mymapper.adelete(ano);
		
	}
	@Override
	public HashMap<String, Object> selectAnnounceOne(int ano) {
		HashMap<String, Object> map = new HashMap<>();
		Announce prev = mymapper.selectAnnouncePrev(ano);
		Announce next = mymapper.selectAnnounceNext(ano);
		map.put("next", next);
		map.put("prev", prev);
		
		
		return map;
	}

}
