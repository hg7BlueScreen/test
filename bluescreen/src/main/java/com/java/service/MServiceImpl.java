package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.java.dto.M_box;
import com.java.mapper.MapMapper;

@Service
public class MServiceImpl implements MService {
	@Autowired MapMapper mmapper;
	@Override
	public ArrayList<M_box> selectMBoxAll() {
		ArrayList<M_box> mbox = mmapper.selectMBoxAll(); 
		return mbox;
	}
	@Override
	public ArrayList<M_box> selectMBoxGu(M_box m_box) {
		//System.out.println(m_box.getGu());
		ArrayList<M_box> mbox = mmapper.selectMBoxGu(m_box);
		return mbox;
	}


}
