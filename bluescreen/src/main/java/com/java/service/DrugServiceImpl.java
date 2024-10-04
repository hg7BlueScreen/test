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
		if(uno == -1) {
			ArrayList<Integer> noList = new ArrayList<>();
			map.put("bookMarkList", noList);
		}else {
			System.out.println("uno : "+uno);
			ArrayList<Integer> bookMarkList = drugMapper.getAllBookMark(uno);
			map.put("bookMarkList", bookMarkList);
		}
		map.put("pageDto", pageDto);
		map.put("list", list);
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
		System.out.println(dno);
		drugMapper.enableBookMarkDrug(uno,dno);
	}

	@Override
	public void disableBookmarkDrug(int uno, int dno) {
		drugMapper.disableBookmarkDrug(uno,dno);
	}

	@Override
	public int selectDrugCount() {
		int drugCount = drugMapper.selectListCount(null, null, 0, 0);
		return drugCount;
	}

	@Override
	public boolean checkNewDrug(Drug drug) {
		Drug checkDrug = drugMapper.selectDrugOne(drug);
		if(checkDrug != null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void insertDrugOne(Drug drug) {
		drugMapper.insertDrugOne(drug);
	}

	@Override
	public ArrayList<Drug> findDrug(String[] textResult) {
		ArrayList<Drug> list = new ArrayList<>();
		for(int i = 0; i < textResult.length; i++) {
			String textPortable = textResult[i].replaceAll("[^가-힣]", "");
			if(textPortable.length() < 5) {
				continue;
			}
			textPortable = textPortable.substring(0, 5);
			ArrayList<Drug> drugOne = drugMapper.findDrug(textPortable);
			if(drugOne.size() == 0) {
				
			}else if(drugOne.size() < 3) {
				for(int j = 0; j < drugOne.size(); j++) {
					list.add(drugOne.get(j));
				}
			}else {
				for(int j = 0; j < 3; j++) {
					list.add(drugOne.get(j));
				}
			}
		}
		return list;
	}

	@Override
	public void insertUserDrugList(String[] dno, int uno) {
		
		for(int i = 0; i < dno.length; i++) {
			drugMapper.insertUserDrugOne(dno[i], uno);
		}
		
	}

	@Override
	public void deleteBookMarkListFromMyPage(String[] dno, String uno) {
		for(int i = 0; i < dno.length; i++) {
			drugMapper.deleteBookMarkListFromMyPage(dno[i], uno);
		}
	}

	@Override
	public int selectMcount(int uno) {
		int Mcount = drugMapper.selectMcount(uno);
		if(Mcount != 0) {
			return Mcount;
			
		}else {
			return 0;
		}
	}

	@Override
	public int selectBcount(int uno) {
		int Bcount = drugMapper.selectBcount(uno);
		if(Bcount != 0) {
			return Bcount;
			
		}else {
			return 0;
		}
	}

	
}