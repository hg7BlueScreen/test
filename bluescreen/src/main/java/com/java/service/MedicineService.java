package com.java.service;

import java.util.HashMap;

import com.java.dto.Medicine;
import com.java.dto.Page;

public interface MedicineService {

	Medicine selectOneMedicine(int mno);
	
	HashMap<String, Object> selectAllMedicine(Page pageDto, String textBox, String categoryDetail, int uno);

	void enableBookMarkMedicine(int uno, int mno);

	void disableBookmarkMedicine(int uno, int mno);

	int selectMedicineCount();

	boolean checkNewMedicine(Medicine medicine);

	void insertMedicineOne(Medicine medicine);


}
