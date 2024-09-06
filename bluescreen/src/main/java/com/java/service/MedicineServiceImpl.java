package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Disease;
import com.java.dto.Medicine;
import com.java.dto.Page;
import com.java.mapper.MedicineMapper;

@Service
public class MedicineServiceImpl implements MedicineService {
	
	@Autowired MedicineMapper mMapper;
	
	@Override
	public Medicine selectOneMedicine(int mno) {
		Medicine med = mMapper.selectOneMedicine(mno);
		return med;
	}
	
	@Override
	public HashMap<String, Object> selectAllMedicine(Page pageDto, String textBox, String categoryDetail, int uno) {
		pageDto = pageMethodMedicine(pageDto, textBox, categoryDetail);
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<Medicine> list = mMapper.selectAll(pageDto, textBox, categoryDetail);
		ArrayList<Integer> bookMarkList = mMapper.getAllBookMark(uno);
		map.put("pageDto", pageDto);
		map.put("list", list);
		map.put("bookMarkList", bookMarkList);
		return map;
	}
	
	private Page pageMethodMedicine(Page pageDto, String textBox, String categoryDetail) {
		// 전체 게시글 수 저장
		pageDto.setListCount(mMapper.selectListCount(textBox, categoryDetail));
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
	public void enableBookMarkMedicine(int uno, int mno) {
		mMapper.enableBookMarkMedicine(uno,mno);
	}

	@Override
	public void disableBookmarkMedicine(int uno, int mno) {
		mMapper.disableBookmarkMedicine(uno,mno);
	}

	@Override
	public int selectMedicineCount() {
		int medicineCount = mMapper.selectListCount(null, null);
		return medicineCount;
	}

	@Override
	public boolean checkNewMedicine(Medicine medicine) {
		Medicine checkMedicine = mMapper.selectMedicineOne(medicine);
		if(checkMedicine != null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void insertMedicineOne(Medicine medicine) {
		mMapper.insertMedicineOne(medicine);
	}
	
	
	
}
