package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Medicine;
import com.java.dto.Page;

@Mapper
public interface MedicineMapper {

	ArrayList<Medicine> selectAll(Page pageDto, String textBox, String categoryDetail);

	int selectListCount(String textBox, String categoryDetail);

	Medicine selectOneMedicine(int mno);

	ArrayList<Integer> getAllBookMark(int uno);

	void enableBookMarkMedicine(int uno, int mno);

	void disableBookmarkMedicine(int uno, int mno);

	Medicine selectMedicineOne(Medicine medicine);

	void insertMedicineOne(Medicine medicine);

}
