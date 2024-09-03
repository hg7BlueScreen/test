package com.java.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.M_box;
import com.java.service.MService;

@Controller
public class MapController {
	@Autowired MService mservice;
	@RequestMapping("/Mmap")
	public String Mmap() {
		return "Mmap";
	}
	@PostMapping("/mBoxgu")
	@ResponseBody
	public ArrayList<M_box> mBoxgu(M_box m_box, Model model){
		//System.out.println(m_box.getGu());
		ArrayList<M_box> mbox = mservice.selectMBoxGu(m_box);
		model.addAttribute("name",m_box.getName());
		model.addAttribute("addr",m_box.getAddr());
		model.addAttribute("phone",m_box.getPhone());
		model.addAttribute("x",m_box.getX());
		model.addAttribute("y",m_box.getY());
		return mbox;
	}
}
