package com.java.service;

import java.util.ArrayList;
import com.java.dto.M_box;

public interface MService {

	ArrayList<M_box> selectMBoxAll();

	ArrayList<M_box> selectMBoxGu(M_box m_box);

}
