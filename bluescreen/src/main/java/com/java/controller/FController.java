package com.java.controller;

import java.io.IOException;
import java.net.URL;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.Drug;
import com.java.dto.Member;
import com.java.dto.Medicine;
import com.java.dto.Page;
import com.java.dto.ScrapNews;
import com.java.service.MyService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import jakarta.servlet.http.HttpSession;

@Controller
public class FController {
	@Autowired HttpSession session;
	@Autowired MyService myservice;
	@RequestMapping("/")
	public String index(Model model) {
		ScrapNews scraper = selectOneNews();
		model.addAttribute("scrap",scraper);
		
		return "index";
	}
	

	private ScrapNews selectOneNews() {
		List<ScrapNews> scrapers = new ArrayList<>();
		String URL = "http://www.bosa.co.kr/news/articleList.html?sc_section_code=S1N5&view_type=sm";
		try {
			// timeout을 설정하지 않으면 ReadTimeoutException이 발생할 수 있다.
			Document doc = Jsoup.connect(URL).timeout(50000).get();
			Elements elements = doc.select("ul[class=type2]").select("li");
			// System.out.println(elements);
			ArrayList<ScrapNews> scraps = new ArrayList<>();
			for (Element element : elements) {
				ScrapNews scrap = new ScrapNews();

				// System.out.println(element);
				scrap.setImgUrl(element.select("img").attr("src")); // String imgUrl =
				// element.select("img").attr("data-src");
				scrap.setTitle(element.select("h4[class=titles]").text()); // String title =
				// element.select("img").attr("alt");
				scrap.setUrl("http://www.bosa.co.kr/" + element.select("a").attr("href")); // String purl =
				// element.select("a").attr("href");
				String[] emlist = element.select("span[class=byline]").text().split(" ");
				scrap.setTeam(emlist[0]); // String
				// content = element.select("div[class=sa_text_lede]").text();
				scrap.setAnchor(emlist[1] + " " + emlist[2]); // String
				scrap.setTime(emlist[3] + " " + emlist[4]); // String
				// press = element.select("div[class=sa_text_press]").text();
				if (scrap != null) {
					scraps.add(scrap);
				}
			}
			int number = (int)Math.round(Math.random()*10);
			
			// model.addAttribute("scrap",scraps.get(number));
			return scraps.get(number);

		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

	@RequestMapping("/board/myPageMedi")
	public String my_medicine(Page pageDto, Model model) {
		//System.out.println(user.getUno());	System.out.println(user.getId());
		Member member = myservice.selectUser((String)session.getAttribute("sessionId"));
		ArrayList<Medicine> mList = myservice.selectMList(member.getUno()); 
		HashMap<String, Object> dList = myservice.selectDList(pageDto, member.getUno()); 
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp tdate = new Timestamp(System.currentTimeMillis());
		ArrayList<Drug> drlist = (ArrayList<Drug>) dList.get("dList");
//		System.out.println(drlist.get(0).getDdate());
//		System.out.println(tdate);
		// System.out.println(end_dt);
		//Date todate = format.parse(tdate);
		for(int i=0;i<drlist.size();i++) {
			if(drlist.get(i).getDdate().compareTo(tdate) == -1) {
				drlist.get(i).setDateCh("past");
			}
		}
		
		model.addAttribute("mList",mList);
		model.addAttribute("dList",dList.get("dList"));
		model.addAttribute("page",dList.get("page"));
		model.addAttribute("member",member);
		System.out.println(member.getDatealarm());
		
		//model.addAttribute("todate",todate);
		
		//System.out.println(mList);
		return "board/myPageMedi";
	}
	@RequestMapping("/board/myPageFind2")
	public String myPageFind2(Page pageDto, Model model) {
		//System.out.println(user.getUno());	System.out.println(user.getId());
		Member member = myservice.selectUser((String)session.getAttribute("sessionId"));
		ArrayList<Medicine> mList = myservice.selectMList(member.getUno()); 
		HashMap<String, Object> dList = myservice.selectDList(pageDto, member.getUno()); 
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp tdate = new Timestamp(System.currentTimeMillis());
		ArrayList<Drug> drlist = (ArrayList<Drug>) dList.get("dList");
//		System.out.println(drlist.get(0).getDdate());
//		System.out.println(tdate);
		// System.out.println(end_dt);
		//Date todate = format.parse(tdate);
		for(int i=0;i<drlist.size();i++) {
			if(drlist.get(i).getDdate().compareTo(tdate) == -1) {
				drlist.get(i).setDateCh("past");
			}
		}
		
		model.addAttribute("mList",mList);
		model.addAttribute("dList",dList.get("dList"));
		model.addAttribute("page",dList.get("page"));
		model.addAttribute("member",member);
		System.out.println(member.getDatealarm());
		
		//model.addAttribute("todate",todate);
		
		//System.out.println(mList);
		return "board/myPageFind2";
	}
	
//	@PostMapping("/deleteCk")
//	@ResponseBody
//	public String deleteCk(List<Integer> dno, int uno) {
//		myservice.deleteCk(dno, uno);
//		return "성공";
//	}
	@PostMapping("/deleteCk")
	@ResponseBody
	public String deleteCk(String[] dno, int uno) {
		int[] dnoNum = new int[dno.length];
		for(int i=0;i<dno.length;i++) {
			dnoNum[i] = Integer.parseInt(dno[i]);
		}
		myservice.deleteCk(dnoNum, uno);
		return "성공";
	}
	@PostMapping("/myMediUp")
	@ResponseBody
	public String myMediUp(int uno, int dno, String myMdate, String item_seq) {
		String ddate = "";
		String result = myservice.myMediAll(uno,dno);
		if(myMdate==null||myMdate=="") {
			myMdate = "730"; // 처방 아닐 시 기본 소비기한
		}
		int datem = Integer.parseInt(myMdate.replaceAll("[^0-9]", "")); // 숫자만 가져옴
		Date date = new Date();
		SimpleDateFormat simpleDateFormat  = new SimpleDateFormat("yy/MM/dd");
		String toDate = simpleDateFormat.format(date);
		System.out.println(toDate);
		try {
			ddate = AddDate(toDate, datem);
			System.out.println(ddate);
		} catch (Exception e) {e.printStackTrace();}
		
		if(result==null) {
			myservice.myMediUp(uno, dno, ddate);
			Timestamp Ddate = myservice.selectDate();
			return "성공";
		}else {
			return "실패";
		}
	}
	
	private static String AddDate(String strDate, int day) throws Exception {
        SimpleDateFormat dtFormat = new SimpleDateFormat("yy/MM/dd");
		Calendar cal = Calendar.getInstance();
		Date dt = dtFormat.parse(strDate);
		cal.setTime(dt);
		cal.add(Calendar.DATE,  day);
		System.out.println("dd"+dtFormat.format(cal.getTime()));
		return dtFormat.format(cal.getTime());
		
	}
	
	@PostMapping("/alarmDate")
	@ResponseBody
	public String alarmDate(String alDate) {
		int uno = (int)session.getAttribute("sessionUno");
		//System.out.println(alDate);//System.out.println(uno);
		myservice.alarmDate(uno, alDate);
		
		return "";
	}


}
