package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Join;
import com.java.dto.Medicine;
import com.java.dto.Page;
import com.java.mapper.MyMapper;

@Service
public class MyServiceImpl implements MyService {
	@Autowired MyMapper mymapper;
	@Override
	public HashMap<String, Object> selectPage(Page pageDto) {
		HashMap<String, Object> map = new HashMap<>();
		
//		int listCount = mymapper.selectListCount();	//총 게시글의 수
//		int maxPage = (int)Math.ceil(listCount/10.0); //최대 페이지
//		int startPage = (int)((pageDto.getPage()-1)/10)*10+1;
//		int endPage = startPage+10-1;
//		//int startRow = (pageDto-1)*10+1;
//		int endRow = startRow+10-1;
//		if(endPage>maxPage) endPage=maxPage;
//		System.out.println("게시글 수 : "+listCount);
//		System.out.println("현재 페이지 : "+page);
//		System.out.println("최대 페이지 : "+maxPage);
//		System.out.println("startPage : "+startPage);
//		System.out.println("endPage : "+endPage);
//		System.out.println("startRow : "+startRow);
//		System.out.println("endRow : "+endRow);
		//ArrayList<Medicine> list = mymapper.selectAll(startRow, endRow);
//		
//		map.put("listCount", listCount);
//		map.put("maxPage", maxPage);
//		map.put("startPage", startPage);
//		map.put("endPage", endPage);
//		map.put("startRow", startRow);
//		map.put("endRow", endRow);
//		map.put("page", page);
		//map.put("list", list);
		
		return map;
	}
	@Override
	public Join selectUser(String attribute) {
		Join selectaddr = mymapper.selectUser(attribute);
		return selectaddr;
	}
	@Override
	public ArrayList<Medicine> selectMdList(int uno) {
		//System.out.println(uno);
		ArrayList<Medicine> mList = mymapper.selectMdList(uno);
		return mList;
	}
	@Override
	public void deleteCk(int[] mnoNum, int uno) {
		for(int i=0;i<mnoNum.length;i++) {
			mymapper.deleteCk(mnoNum[i], uno);
		}
		
	}
	@Override
	public void myMediUp(int uno, int mno) {
		mymapper.myMediUp(uno, mno);
	}
	@Override
	public String myMediAll(int uno, int mno) {
		String result = mymapper.myMediAll(uno, mno);
		System.out.println(result);
		return result;
	}


}
