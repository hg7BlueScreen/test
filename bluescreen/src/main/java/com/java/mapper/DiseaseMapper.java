package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Disease;
import com.java.dto.Page;

@Mapper
public interface DiseaseMapper {

	int selectListCount(String textBox, String categoryDetail);

	ArrayList<Disease> selectAll(Page pageDto, String textBox, String categoryDetail);


}
