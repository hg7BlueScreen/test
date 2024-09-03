package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Medicine;
import com.java.dto.Page;

@Mapper
public interface MedicineMapper {

	ArrayList<Medicine> selectAll(Page pageDto, String textBox);

	int selectListCount(String textBox);

	Medicine selectOneMedicine(int mno);

}
