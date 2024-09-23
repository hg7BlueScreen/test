package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Disease;
import com.java.dto.Medicine;
import com.java.dto.Page;
import com.java.mapper.DiseaseMapper;
import com.java.mapper.MedicineMapper;

@Service
public class DiseaseServiceImpl implements DiseaseService {

	@Autowired
	DiseaseMapper dMapper;
	@Autowired
	MedicineMapper mMapper;

	@Override
	public HashMap<String, Object> selectAllDisease(Page pageDto, String textBox, String categoryDetail, int uno, int onlyBookMark) {
		pageDto = pageMethodDisease(pageDto, textBox, categoryDetail);
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<Disease> list = dMapper.selectAll(pageDto, textBox, categoryDetail);
		ArrayList<Integer> bookMarkList = dMapper.getAllBookMark(uno);
		map.put("pageDto", pageDto);
		map.put("list", list);
		map.put("bookMarkList", bookMarkList);
		return map;
	}

	private Page pageMethodDisease(Page pageDto, String textBox, String categoryDetail) {
		// 전체 게시글 수 저장
		pageDto.setListCount(dMapper.selectListCount(textBox, categoryDetail));
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
	public void enableBookMarkDisease(int uno, int dno) {
		dMapper.enableBookMarkDisease(uno, dno);
	}


	@Override
	public void disableBookMarkDisease(int uno, int dno) {
		dMapper.disableBookMarkDisease(uno, dno);
	}

	@Override
	public int selectDiseaseCount() {
		int diseaseCount = dMapper.selectListCount(null, null);
		return diseaseCount;
	}

	@Override
	public boolean checkNewDisease(Disease disease) {
		Disease checkDisease = dMapper.selectDiseaseOne(disease);
		if(checkDisease != null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void insertDiseaseOne(Disease disease) {
		dMapper.insertDiseaseOne(disease);
	}


}
