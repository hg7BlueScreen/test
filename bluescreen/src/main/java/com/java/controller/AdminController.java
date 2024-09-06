package com.java.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.NodeList;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.java.dto.Disease;
import com.java.dto.Medicine;
import com.java.service.DiseaseService;
import com.java.service.MedicineService;

@Controller
public class AdminController {

	@Autowired
	DiseaseService dservice;
	@Autowired
	MedicineService mservice;

	@RequestMapping("/admin_update")
	public String admin_update(Model model) {
		int diseaseCount = dservice.selectDiseaseCount();
		int page = diseaseCount / 100 + 1;
		model.addAttribute("page", page);
		return "admin_update";
	}

	@GetMapping("/updateCheckDisease")
	@ResponseBody
	public List<Disease> updateCheckDisease(Model model) throws Exception {
		// 본인이 받은 api키를 추가
		String key1 = "";
		int diseaseCount = dservice.selectDiseaseCount();
		int page = diseaseCount / 100 + 1;
		try {
			String serviceKey = "0nCpudgmWV03aBHAVaXghXKMUDOEVBOlavcvZdz%2Bc99KB07ML6%2BUx3VyIIZGq7J18bgoBMZ02iLfcEuD4TV7FA%3D%3D";
			String url = "https://apis.data.go.kr/B551182/diseaseInfoService1/getDissNameCodeList1";
			url += "?serviceKey=" + serviceKey;
			url += "&numOfRows=" + 100;
			url += "&pageNo=" + page;
			url += "&sickType=" + 1;
			url += "&medTp=" + 1;

			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// 제일 첫번째 태그
			doc.getDocumentElement().normalize();
			List<Disease> diseaseList = new ArrayList<>();
			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("item");
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				Element eElement = (Element) nNode;
				Disease disease = new Disease();
				disease.setSickCd(getTagValue("sickCd", eElement));
				disease.setSickNm(getTagValue("sickNm", eElement));
				boolean checkNewDisease = dservice.checkNewDisease(disease);
				// System.out.println(checkNewDisease);
				if (checkNewDisease) {
					// dservice.insertDiseaseOne(disease);
					diseaseList.add(disease);
				}
			}
			return diseaseList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@GetMapping("/updateCheckMedicine")
	@ResponseBody
	public List<Medicine> updateCheckMedicine(Model model) throws Exception {
		// 본인이 받은 api키를 추가
		String key1 = "";
		int medicineCount = mservice.selectMedicineCount();
		int page = (medicineCount / 100) + 1;
		Date date = new Date();
		SimpleDateFormat formatMonth = new SimpleDateFormat("MM");
		SimpleDateFormat formatYear = new SimpleDateFormat("yyyy");
		String StringMonth = formatMonth.format(date);
		String StringYear = formatYear.format(date);
		int month = (Integer.parseInt(StringMonth)) - 1;
		int year = (Integer.parseInt(StringYear)) - 1;
		System.out.println(month);
		try {
			// pageNo=49&numOfRows=100&type=xml
			String serviceKey = "0nCpudgmWV03aBHAVaXghXKMUDOEVBOlavcvZdz%2Bc99KB07ML6%2BUx3VyIIZGq7J18bgoBMZ02iLfcEuD4TV7FA%3D%3D";
			String url = "https://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList";
			url += "?serviceKey=" + serviceKey;
			url += "&numOfRows=" + 100;
			url += "&pageNo=" + 1;
			url += "&type=xml";
			if(month == 0) {
				url += "&openDe="+year+"-12";
			}else if(month < 10) {
				url += "&openDe=2024-0"+month;
			}else {
				url += "&openDe=2024-"+month;
			}
			

			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// System.out.println(doc.getDocumentElement().getTextContent());

			// 제일 첫번째 태그 
			doc.getDocumentElement().normalize(); 
			List<Medicine> medicineList = new ArrayList<>(); 
			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("item");
			for(int i = 0; i < nList.getLength(); i++) {
				Medicine medicine = new Medicine();
				medicine.setEntpName(doc.getDocumentElement().getElementsByTagName("entpName").item(i).getTextContent());
				medicine.setItemName(doc.getDocumentElement().getElementsByTagName("itemName").item(i).getTextContent());
				medicine.setItemSeq(doc.getDocumentElement().getElementsByTagName("itemSeq").item(i).getTextContent());
				medicine.setEfcyQesitm(doc.getDocumentElement().getElementsByTagName("efcyQesitm").item(i).getTextContent());
				medicine.setUseMethodQesitm(doc.getDocumentElement().getElementsByTagName("useMethodQesitm").item(i).getTextContent());
				medicine.setAtpnWarnQesitm(doc.getDocumentElement().getElementsByTagName("atpnWarnQesitm").item(i).getTextContent());
				medicine.setAtpnQesitm(doc.getDocumentElement().getElementsByTagName("atpnQesitm").item(i).getTextContent());
				medicine.setIntrcQesitm(doc.getDocumentElement().getElementsByTagName("intrcQesitm").item(i).getTextContent());
				medicine.setSeQesitm(doc.getDocumentElement().getElementsByTagName("seQesitm").item(i).getTextContent());
				medicine.setDepositMethodQesitm(doc.getDocumentElement().getElementsByTagName("depositMethodQesitm").item(i).getTextContent());
				medicine.setImageURL(doc.getDocumentElement().getElementsByTagName("itemImage").item(i).getTextContent());
				medicine.setUpdateDe(doc.getDocumentElement().getElementsByTagName("updateDe").item(i).getTextContent());
				boolean checkNewMedicine = mservice.checkNewMedicine(medicine);
				// System.out.println(checkNewDisease);
				if (checkNewMedicine) {
					// dservice.insertDiseaseOne(disease);
					medicineList.add(medicine);
				}
			}
			return medicineList;
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

	@PostMapping("/insertDiseaseOne")
	@ResponseBody
	public String insertDiseaseOne(Disease disease) {
		dservice.insertDiseaseOne(disease);
		return "성공";
	}
	
	@PostMapping("/insertMedicineOne")
	@ResponseBody
	public String insertMedicineOne(Medicine medicine) {
		mservice.insertMedicineOne(medicine);
		return "성공";
	}
	
}
