package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Medicine;
import com.java.mapper.myMapper;

@Service
public class myServiceImpl implements myService {
	@Autowired myMapper mymapper;
	@Override
	public HashMap<String, Object> selectAll(int page) {
		HashMap<String, Object> map = new HashMap<>();
		
		int listCount = mymapper.selectListCount();	//총 게시글의 수
		int maxPage = (int)Math.ceil(listCount/10.0); //최대 페이지
		int startPage = (int)((page-1)/10)*10+1;
		int endPage = startPage+10-1;
		int startRow = (page-1)*10+1;
		int endRow = startRow+10-1;
		if(endPage>maxPage) endPage=maxPage;
		System.out.println("게시글 수 : "+listCount);
		System.out.println("현재 페이지 : "+page);
		System.out.println("최대 페이지 : "+maxPage);
		System.out.println("startPage : "+startPage);
		System.out.println("endPage : "+endPage);
		System.out.println("startRow : "+startRow);
		System.out.println("endRow : "+endRow);
		//ArrayList<Medicine> list = mymapper.selectAll(startRow, endRow);
		
		map.put("listCount", listCount);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("page", page);
		//map.put("list", list);
		
		return map;
	}
	@Override
	public String selectaddr(String attribute) {
		String selectaddr = mymapper.selectaddr(attribute);
		return selectaddr;
	}


}
