package com.java.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelExtensionsKt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.NodeList;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.java.dto.Caution;
import com.java.dto.Complain;
import com.java.dto.Disease;
import com.java.dto.Drug;
import com.java.dto.Medicine;
import com.java.dto.Member;
import com.java.service.DiseaseService;
import com.java.service.DrugService;
import com.java.service.MedicineService;
import com.java.service.MemberService;

@Controller
public class AdminController {

	@Autowired DrugService drugService;
	@Autowired MemberService memberService;
	
	@RequestMapping("/admin_update")
	public String admin_update(Model model) {
		return "admin_update";
	}
	
	@GetMapping("/updateCheckDrug")
	@ResponseBody
	public List<Drug> updateCheckDrug(Model model) throws Exception {
		// 본인이 받은 api키를 추가
		String key1 = "";
		int drugCount = drugService.selectDrugCount();
		drugCount = 46556;
		int page = (drugCount / 100) + 1;
		try {
			// pageNo=49&numOfRows=100&type=xml
			String serviceKey = "0nCpudgmWV03aBHAVaXghXKMUDOEVBOlavcvZdz%2Bc99KB07ML6%2BUx3VyIIZGq7J18bgoBMZ02iLfcEuD4TV7FA%3D%3D";
			String url = "https://apis.data.go.kr/1471000/DrugPrdtPrmsnInfoService06/getDrugPrdtPrmsnDtlInq05";
			url += "?serviceKey=" + serviceKey;
			url += "&numOfRows=" + 100;
			url += "&pageNo=" + page;
			url += "&type=xml";
			
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// System.out.println(doc.getDocumentElement().getTextContent());

			// 제일 첫번째 태그 
			doc.getDocumentElement().normalize();
			List<Drug> drugList = new ArrayList<>(); 
			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("item");
			for(int i = 0; i < nList.getLength(); i++) {
				Drug drug = new Drug();
				
				drug.setItem_seq(Integer.parseInt(doc.getDocumentElement().getElementsByTagName("ITEM_SEQ").item(i).getTextContent()));
				drug.setItem_name(doc.getDocumentElement().getElementsByTagName("ITEM_NAME").item(i).getTextContent());
				drug.setEntp_name(doc.getDocumentElement().getElementsByTagName("ENTP_NAME").item(i).getTextContent());
				
				boolean checkNewDrug = drugService.checkNewDrug(drug); 
				// System.out.println(checkNewDisease);
				if (checkNewDrug) { 

				}else {
					continue;
				}
				
				drug.setItem_permit_date(doc.getDocumentElement().getElementsByTagName("ITEM_PERMIT_DATE").item(i).getTextContent());
				drug.setEtc_otc_code(doc.getDocumentElement().getElementsByTagName("ETC_OTC_CODE").item(i).getTextContent());
				drug.setChart(doc.getDocumentElement().getElementsByTagName("CHART").item(i).getTextContent());
				drug.setMaterial_name(doc.getDocumentElement().getElementsByTagName("MATERIAL_NAME").item(i).getTextContent());
				drug.setStorage_method(doc.getDocumentElement().getElementsByTagName("STORAGE_METHOD").item(i).getTextContent());
				drug.setValid_term(doc.getDocumentElement().getElementsByTagName("VALID_TERM").item(i).getTextContent());
				drug.setEntp_no(Integer.parseInt(doc.getDocumentElement().getElementsByTagName("ENTP_NO").item(i).getTextContent()));
				drug.setMain_item_ingr(doc.getDocumentElement().getElementsByTagName("MAIN_ITEM_INGR").item(i).getTextContent());
				
				if(doc.getDocumentElement().getElementsByTagName("ATC_CODE").item(i) != null) {
					drug.setAtc_code(doc.getDocumentElement().getElementsByTagName("ATC_CODE").item(i).getTextContent());
				}
				
				if(doc.getDocumentElement().getElementsByTagName("ITEM_IMAGE").item(i) != null) {
					drug.setImageURL(doc.getDocumentElement().getElementsByTagName("ITEM_IMAGE").item(i).getTextContent());
				}
				
				drugList.add(drug); 
				
			}
			return drugList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getTagValue(String tag, Element eElement) {

		// 결과를 저장할 result 변수 선언
		String result = "";

		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

		result = nlList.item(0).getTextContent();

		return result;
	}

	public static String getTagValue(String tag, String childTag, Element eElement) {

		// 결과를 저장할 result 변수 선언
		String result = "";

		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

		for (int i = 0; i < eElement.getElementsByTagName(childTag).getLength(); i++) {

			// result += nlList.item(i).getFirstChild().getTextContent() + " ";
			result += nlList.item(i).getChildNodes().item(0).getTextContent() + " ";
		}

		return result;
	}
	
	/*
	 * @PostMapping("/insertMedicineOne")
	 * 
	 * @ResponseBody public String insertMedicineOne(Medicine medicine) {
	 * mservice.insertMedicineOne(medicine); return "성공"; }
	 */
	
	@PostMapping("/insertDrugOne")
	@ResponseBody
	public String insertDrugOne(Drug drug) {
		drugService.insertDrugOne(drug);
		return "성공";
	}
	
	@RequestMapping("/admin_report")
	public String adreport(@RequestParam(defaultValue = "0") int uno, Model model) {
		Member member = memberService.selectOneMember(uno);
		ArrayList<Complain> complainList = memberService.selectComplainAll();
		model.addAttribute("complain", complainList);
		model.addAttribute("member",member);
		return "admin_report";
	}
	
	@RequestMapping("/admin_user")
	public String admin_user(@RequestParam(defaultValue = "name") String userCategory, String keyword, Model model) {
		ArrayList<Member> memberList = memberService.selectAllMember(userCategory, keyword);
		model.addAttribute("memberList",memberList);
		return "admin_user";
	}
	
	@RequestMapping("/adminpage")
	public String adminpage() {
		return "adminpage";
	}
	
	@PostMapping("/applyCaution")
	@ResponseBody
	public String applyCaution(Caution caution) {
		memberService.setCaution(caution);
		return "성공";
	}
	
	@PostMapping("/deleteReportOne")
	@ResponseBody
	public String deleteReportOne(int cno) {
		memberService.deleteReportOne(cno);
		return "성공";
	}
	
	@RequestMapping("/jumpToBoard")
	public String jumpToBoard(int cno) {
		// cno를 통해 bno를 가져온 후 return 값을 "bread?bno="+bno;로 바꿔야 함.
		return "redirect:/";
	}
	
	
}
