package com.java.controller;

import java.util.ArrayList;
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
import com.java.dto.Drug;
import com.java.dto.DrugEffect;
import com.java.dto.DrugGeneralWarning;
import com.java.dto.Member;
import com.java.dto.Medicine;
import com.java.dto.Page;
import com.java.service.DiseaseService;
import com.java.service.DrugService;
import com.java.service.MedicineService;
import com.java.service.MyService;

import jakarta.servlet.http.HttpSession;

@Controller
public class DictController {
	
	@Autowired DiseaseService dservice;
	@Autowired MedicineService mservice;
	@Autowired DrugService drugService;
	@Autowired HttpSession session;
	@Autowired MyService myservice;
	@RequestMapping("/dict")
	public String dict(Page pageDto, Model model, String category, String textBox, String categoryDetail, @RequestParam(defaultValue = "0") int onlyBookMark) {
		// int uno = (int)session.getAttribute("sessionUno");
		//session.setAttribute("sessionUno", 0);
		int uno = -1;
		
		
		if(session.getAttribute("sessionId")==null) {
			
		}else {
			String id = (String)session.getAttribute("sessionId");
			Member user = myservice.selectUser(id);
			uno = user.getUno();
		}

		
		if(category != null) {
			if(category.equals("disease")) {
				HashMap<String, Object> map = dservice.selectAllDisease(pageDto, textBox, categoryDetail,uno, onlyBookMark);
				model.addAttribute("list", map.get("list"));
				model.addAttribute("category", category);
				model.addAttribute("pageDto",pageDto);
				model.addAttribute("textBox",textBox);
				model.addAttribute("categoryDetail",categoryDetail);
				model.addAttribute("onlyBookMark",onlyBookMark);
				model.addAttribute("bookMarkListDisease", map.get("bookMarkList"));
				/*
				 * for(int i = 0; i < 10; i++) { System.out.println(map.get("bookMarkList")); }
				 */
			}else if(category.equals("drug")) {
				/*
				 * HashMap<String, Object> map = mservice.selectAllMedicine(pageDto, textBox,
				 * categoryDetail, uno); model.addAttribute("list", map.get("list"));
				 * model.addAttribute("category", category);
				 * model.addAttribute("pageDto",pageDto); model.addAttribute("textBox",textBox);
				 * model.addAttribute("categoryDetail",categoryDetail);
				 * model.addAttribute("bookMarkListMedicine", map.get("bookMarkList"));
				 */
				HashMap<String, Object> map = drugService.selectAllDrugs(pageDto, textBox, categoryDetail, uno, onlyBookMark);
				model.addAttribute("list", map.get("list"));
				model.addAttribute("category", category);
				model.addAttribute("pageDto",pageDto);
				model.addAttribute("textBox",textBox);
				model.addAttribute("categoryDetail",categoryDetail);
				model.addAttribute("onlyBookMark",onlyBookMark);
				model.addAttribute("bookMarkListDrug", map.get("bookMarkList"));
			}
		}
		return "dictionary";
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
	
	@PostMapping("/getDrugOne")
	@ResponseBody
	public HashMap<String, Object> getDrugOne(int dno) {
		HashMap<String, Object> map = new HashMap<>();
		String id = (String)session.getAttribute("sessionId");
		ArrayList<DrugEffect> drugEffect = drugService.selectOneDrugEffect(dno);
		ArrayList<DrugGeneralWarning> drugGeneralWarning = drugService.selectOneDrugGeneralWarning(dno);
		Drug drug = drugService.selectOneDrug(dno);
		if(session.getAttribute("sessionId")!=null) {
			Member user = myservice.selectUser(id);
			String myMedi = myservice.myMediAll(user.getUno(), dno);
			drug.setDefendOverInsert(myMedi);
		}
		
		map.put("drug", drug);
		map.put("drugEffect", drugEffect);
		map.put("drugGeneralWarning", drugGeneralWarning);
		return map;
	}
	
	@PostMapping("/enableBookMarkDrug")
	@ResponseBody
	public String enableBookMarkDrug(int uno, int dno) {
		drugService.enableBookMarkDrug(uno,dno);
		return "성공";
	}
	
	@PostMapping("/disableBookMarkDrug")
	@ResponseBody
	public String disableBookMarkDrug(int uno, int dno) {
		drugService.disableBookmarkDrug(uno,dno);
		return "성공";
	}
}
