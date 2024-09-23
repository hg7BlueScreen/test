package com.java.service;

import java.util.HashMap;

import com.java.dto.Disease;
import com.java.dto.Page;

public interface DiseaseService {

	HashMap<String, Object> selectAllDisease(Page pageDto, String textBox, String categoryDetail, int uno, int onlyBookMark);

	void enableBookMarkDisease(int uno, int dno);

	void disableBookMarkDisease(int uno, int dno);

	int selectDiseaseCount();

	boolean checkNewDisease(Disease disease);

	void insertDiseaseOne(Disease disease);


}
