package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import com.java.dto.M_box;

@Mapper
public interface MapMapper {

	ArrayList<M_box> selectMBoxAll();

	ArrayList<M_box> selectMBoxGu(M_box m_box);
	
}
