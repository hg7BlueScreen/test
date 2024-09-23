package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.java.dto.Drug;
import com.java.dto.DrugEffect;
import com.java.dto.DrugGeneralWarning;
import com.java.dto.Page;

public interface DrugService {

	HashMap<String, Object> selectAllDrugs(Page pageDto, String textBox, String categoryDetail, int uno, int onlyBookMark);

	Drug selectOneDrug(int dno);

	ArrayList<DrugEffect> selectOneDrugEffect(int dno);

	ArrayList<DrugGeneralWarning> selectOneDrugGeneralWarning(int dno);

	void enableBookMarkDrug(int uno, int dno);

	void disableBookmarkDrug(int uno, int dno);


}
