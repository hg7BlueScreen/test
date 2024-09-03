package com.java.service;

import java.util.HashMap;

import com.java.dto.Medicine;
import com.java.dto.Page;

public interface MedicineService {

	Medicine selectOneMedicine(int mno);
	
	HashMap<String, Object> selectAllMedicine(Page pageDto, String textBox);

}
