package com.java.service;

import java.util.HashMap;

import com.java.dto.Disease;
import com.java.dto.Page;

public interface DiseaseService {

	HashMap<String, Object> selectAllDisease(Page pageDto, String textBox);

	


}
