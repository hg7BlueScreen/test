package com.java.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.catalina.User;
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
import com.java.dto.Join;
import com.java.dto.Medicine;
import com.java.dto.Page;
import com.java.dto.Scrap;
import com.java.service.MyService;

import jakarta.servlet.http.HttpSession;

@Controller
public class FController {
	@Autowired HttpSession session;
	@Autowired MyService myservice;
	@RequestMapping("/")
	public String index(Model model) {
		session.setAttribute("id", "testD"); 
		session.setAttribute("nickname", "시험드래곤");
		Join user = myservice.selectUser((String)session.getAttribute("id"));
		session.setAttribute("addr", user.getAddress());
		session.setAttribute("uno", user.getUno());
		//System.out.println(user.getUno());System.out.println(user.getAddress());
		model.addAttribute("user",user);
		String URL = "http://www.bosa.co.kr/news/articleList.html?sc_section_code=S1N5&view_type=sm";
		List<Scrap> scrapers = new ArrayList<>();
		try {
			// timeout을 설정하지 않으면 ReadTimeoutException이 발생할 수 있다.
			Document doc = Jsoup.connect(URL).timeout(50000).get();
			Elements elements = doc.select("ul[class=type2]").select("li");
			// System.out.println(elements);
			ArrayList<Scrap> scraps = new ArrayList<>();
			for (Element element : elements) {
				Scrap scrap = new Scrap();

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
			model.addAttribute("scrap",scraps.get(number));

		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return "index";
	}

	@RequestMapping("/my_medicine")
	public String my_medicine(Page pageDto, Model model) {
		//System.out.println("aa"+join);
		session.setAttribute("id", "testD");
		Join user = myservice.selectUser((String)session.getAttribute("id"));
		session.setAttribute("uno", user.getUno());
		//System.out.println(user.getUno());	System.out.println(user.getId());
		ArrayList<Drug> mList = myservice.selectMdList(user.getUno()); 
		
		HashMap<String, Object> map = myservice.selectPage(pageDto);
		//ArrayList<Medicine> medicine = myservice.myMedicineList(uno);
		model.addAttribute("pageDto",pageDto);
		model.addAttribute("mList",mList);
		//System.out.println(mList);
		//System.out.println("maxPage : "+map.get("maxPage"));
		
		return "my_medicine";
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
	public String myMediUp(int uno, int dno, String myMdate) {
		String mdate = "";
		String result = myservice.myMediAll(uno,dno);
		if(myMdate==null||myMdate=="") {
			myMdate = "730"; // 처방 아닐 시 기본 소비기한
		}
		int datem = Integer.parseInt(myMdate.replaceAll("[^0-9]", ""));
		String dateFormatType = "yyyyMMdd";
		Date date = new Date();
		SimpleDateFormat simpleDateFormat  = new SimpleDateFormat(dateFormatType);
		String toDate = simpleDateFormat.format(date);
		System.out.println(toDate);
		try {
			mdate = AddDate(toDate, datem);
			System.out.println(mdate);
		} catch (Exception e) {e.printStackTrace();}
		
		if(result==null) {
			myservice.myMediUp(uno, dno, mdate);
			return "성공";
		}else {
			return "실패";
		}
		
	}
	private static String AddDate(String strDate, int day) throws Exception {
        SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		Date dt = dtFormat.parse(strDate);
		cal.setTime(dt);
		cal.add(Calendar.DATE,  day);
		return dtFormat.format(cal.getTime());
	}
	@PostMapping("/alramDate")
	@ResponseBody
	public String alramDate(String alDate) {
		int uno = (int)session.getAttribute("uno");
		//System.out.println(alDate);
		//System.out.println(uno);
		myservice.alramDate(uno, alDate);
		return "";
	}
	@RequestMapping("/index1")
	public String index1() {
		return "index1";
	}

	@RequestMapping("/adminpage")
	public String adminpage() {
		return "adminpage";
	}

	@RequestMapping("/index_2")
	public String index_2() {
		return "index_2";
	}

	@RequestMapping("/index4cde_2")
	public String index4cde_2() {
		return "index4cde_2";
	}

	@RequestMapping("/index77f6_2")
	public String index77f6_2() {
		return "index77f6_2";
	}

	@RequestMapping("/indexa49c_2")
	public String indexa49c_2() {
		return "indexa49c_2";
	}

	@RequestMapping("/indexac60_2")
	public String indexac60_2() {
		return "indexac60_2";
	}

	@RequestMapping("/indexe939_2")
	public String indexe939_2() {
		return "indexe939_2";
	}

}
