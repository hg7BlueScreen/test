package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Drug;
import com.java.dto.DrugEffect;
import com.java.dto.DrugGeneralWarning;
import com.java.dto.Medicine;
import com.java.dto.Page;
import com.java.mapper.DrugMapper;

@Service
public class DrugServiceImpl implements DrugService {
	@Autowired DrugMapper drugMapper;
	
	
	@Override
	public HashMap<String, Object> selectAllDrugs(Page pageDto, String textBox, String categoryDetail, int uno, int onlyBookMark) {
		pageDto = pageMethodDrug(pageDto, textBox, categoryDetail, onlyBookMark, uno);
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<Medicine> list = drugMapper.selectAll(pageDto, textBox, categoryDetail, onlyBookMark, uno);
		ArrayList<Integer> bookMarkList = drugMapper.getAllBookMark(uno);
		map.put("pageDto", pageDto);
		map.put("list", list);
		map.put("bookMarkList", bookMarkList);
		return map;
	}
	
	private Page pageMethodDrug(Page pageDto, String textBox, String categoryDetail, int onlyBookMark, int uno) {
		// 전체 게시글 수 저장
		pageDto.setListCount(drugMapper.selectListCount(textBox, categoryDetail, onlyBookMark, uno));
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
	public Drug selectOneDrug(int dno) {
		Drug drug = drugMapper.selectOneMedicine(dno);
		return drug;
	}

	@Override
	public ArrayList<DrugEffect> selectOneDrugEffect(int dno) {
		ArrayList<DrugEffect> drugEffect = drugMapper.selectOneDrugEffect(dno);
		return drugEffect;
	}

	@Override
	public ArrayList<DrugGeneralWarning> selectOneDrugGeneralWarning(int dno) {
		ArrayList<DrugGeneralWarning> drugGeneralWarning = drugMapper.selectOneDrugGeneralWarning(dno);
		return drugGeneralWarning;
	}

	@Override
	public void enableBookMarkDrug(int uno, int dno) {
		drugMapper.enableBookMarkDrug(uno,dno);
	}

	@Override
	public void disableBookmarkDrug(int uno, int dno) {
		drugMapper.disableBookmarkDrug(uno,dno);
	}

}
