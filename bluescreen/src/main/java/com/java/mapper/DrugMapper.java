package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Drug;
import com.java.dto.DrugEffect;
import com.java.dto.DrugGeneralWarning;
import com.java.dto.Medicine;
import com.java.dto.Page;

@Mapper
public interface DrugMapper {

	int selectListCount(String textBox, String categoryDetail, int onlyBookMark, int uno);

	ArrayList<Medicine> selectAll(Page pageDto, String textBox, String categoryDetail, int onlyBookMark, int uno);

	ArrayList<Integer> getAllBookMark(int uno);

	Drug selectOneMedicine(int dno);

	ArrayList<DrugEffect> selectOneDrugEffect(int dno);

	ArrayList<DrugGeneralWarning> selectOneDrugGeneralWarning(int dno);

	void enableBookMarkDrug(int uno, int dno);

	void disableBookmarkDrug(int uno, int dno);

	Drug selectDrugOne(Drug drug);

	void insertDrugOne(Drug drug);

	ArrayList<Drug> findDrug(String textPortable);

	void insertUserDrugOne(String dno, int uno);

	void deleteBookMarkListFromMyPage(String dno, String uno);

	int selectMcount(int uno);

	int selectBcount(int uno);


}
