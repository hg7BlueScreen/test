package com.java.controller;

import java.util.Arrays;
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
import com.java.service.MyService;

import jakarta.servlet.http.HttpSession;

@Controller
public class DictController {
	
	@Autowired DiseaseService dservice;
	@Autowired MedicineService mservice;
	@Autowired MyService myservice;
	@Autowired HttpSession session;
	@RequestMapping("/dict")
	public String dict(Page pageDto, Model model, String category, String textBox, String categoryDetail) {
		// int uno = (int)session.getAttribute("sessionUno");
		int uno = 0;
		if(category != null) {
			if(category.equals("disease")) {
				HashMap<String, Object> map = dservice.selectAllDisease(pageDto, textBox, categoryDetail, uno);
				model.addAttribute("list", map.get("list"));
				model.addAttribute("category", category);
				model.addAttribute("pageDto",pageDto);
				model.addAttribute("textBox",textBox);
				model.addAttribute("categoryDetail",categoryDetail);
				model.addAttribute("bookMarkListDisease", map.get("bookMarkList"));
				/*
				 * for(int i = 0; i < 10; i++) { System.out.println(map.get("bookMarkList")); }
				 */
			}else if(category.equals("medicine")) {
				HashMap<String, Object> map = mservice.selectAllMedicine(pageDto, textBox, categoryDetail, uno);
				model.addAttribute("list", map.get("list"));
				model.addAttribute("category", category);
				model.addAttribute("pageDto",pageDto);
				model.addAttribute("textBox",textBox);
				model.addAttribute("categoryDetail",categoryDetail);
				model.addAttribute("bookMarkListMedicine", map.get("bookMarkList"));
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
		String myMedi = myservice.myMediAll((int)session.getAttribute("uno"), mno);
		med.setUno(myMedi);
		return med;
	}
	
	@PostMapping("/enableBookMarkDisease")
	@ResponseBody
	public String enableBookMarkDisease(int uno, int dno) {
		dservice.enableBookMarkDisease(uno,dno);
		return "성공";
	}
	
	@PostMapping("/disableBookMarkDisease")
	@ResponseBody
	public String disableBookMarkDisease(int uno, int dno) {
		dservice.disableBookMarkDisease(uno,dno);
		return "성공";
	}
	
	@PostMapping("/enableBookMarkMedicine")
	@ResponseBody
	public String enableBookMarkMedicine(int uno, int mno) {
		mservice.enableBookMarkMedicine(uno,mno);
		return "성공";
	}
	
	@PostMapping("/disableBookMarkMedicine")
	@ResponseBody
	public String disableBookMarkMedicine(int uno, int mno) {
		mservice.disableBookmarkMedicine(uno,mno);
		return "성공";
	}
}
