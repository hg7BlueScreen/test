package com.java.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.Drug;
import com.java.service.DrugService;

import jakarta.servlet.http.HttpSession;
import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

@Controller
public class ImageToString {
	@Autowired DrugService drugService;
	@Autowired HttpSession session;
	
	@RequestMapping("/imageJsp")
	public String imageJsp() {
		return "imageJsp";
	}
	
	@PostMapping("/imageToString")
	@ResponseBody
	public ArrayList<Drug> imageToString(@RequestPart MultipartFile file, Model model) {
		
		String fileName = "";
		if(!file.isEmpty()) {
			String oriFileName = file.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			fileName = uuid+"_"+oriFileName;
			String uploadUrl = "c:/upload/";
			File f = new File(uploadUrl+fileName); 
			try {
				file.transferTo(f);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		String datapath = "src/main/resources";
	    String testResourcesDataPath = "c:/upload/";
	    File imageFile;
	    ITesseract instance;

	    instance = new Tesseract();
	    instance.setDatapath(new File(datapath).getPath());
	    instance.setLanguage("eng+kor");
	    
	    try {
	      ImageIO.scanForPlugins();
	      imageFile = new File(testResourcesDataPath, fileName);
	      String result = instance.doOCR(imageFile);
	      String[] textResult = result.split("\\n");
	      ArrayList<Drug> list = drugService.findDrug(textResult);
	      model.addAttribute("drugList", list);
		  return list;
	    } catch (TesseractException e) {
	      System.out.println(e.getMessage());
	    }
	    return null;
	}
	
	@PostMapping("/insertDrugImage")
	@ResponseBody
	public String insertDrugImage(String[] dno) {
		int uno = (int)session.getAttribute("uno");
		drugService.insertUserDrugList(dno, uno);
		return "성공";
	}
	
}
