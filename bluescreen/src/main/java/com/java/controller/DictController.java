package com.java.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.Disease;
import com.java.dto.Medicine;
import com.java.dto.Page;
import com.java.service.DiseaseService;
import com.java.service.MedicineService;

@Controller
public class DictController {
	
	@Autowired DiseaseService dservice;
	@Autowired MedicineService mservice;
	
	@RequestMapping("/dict")
	public String dict(Page pageDto, Model model, String category, String textBox, String categoryDetail) {
		System.out.println(categoryDetail);
		System.out.println(textBox);
		if(category != null) {
			if(category.equals("disease")) {
				HashMap<String, Object> map = dservice.selectAllDisease(pageDto, textBox, categoryDetail);
				model.addAttribute("list", map.get("list"));
				model.addAttribute("category", category);
				model.addAttribute("pageDto",pageDto);
				model.addAttribute("textBox",textBox);
				model.addAttribute("categoryDetail",categoryDetail);
			}else if(category.equals("medicine")) {
				HashMap<String, Object> map = mservice.selectAllMedicine(pageDto, textBox, categoryDetail);
				model.addAttribute("list", map.get("list"));
				model.addAttribute("category", category);
				model.addAttribute("pageDto",pageDto);
				model.addAttribute("textBox",textBox);
				model.addAttribute("categoryDetail",categoryDetail);
			}
		}
		return "dictionary";
	}
	
	@RequestMapping("/admin_report")
	public String adreport() {
		return "admin_report";
	}
	
	@RequestMapping("/admin_user")
	public String admin_user() {
		return "admin_user";
	}
	
	@RequestMapping("/modal")
	public String modal() {
		return "modal";
	}
	
	@PostMapping("/getMedicineOne")
	@ResponseBody
	public Medicine getMedicineOne(int mno) {
		Medicine med = mservice.selectOneMedicine(mno);
		return med;
	}
	
	
}
