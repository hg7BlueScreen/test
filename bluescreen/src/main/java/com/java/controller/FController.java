package com.java.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.dto.Scrap;
import com.java.service.myService;

import jakarta.servlet.http.HttpSession;

@Controller
public class FController {
	@Autowired HttpSession session;
	@Autowired myService myservice;
	@RequestMapping("/")
	public String index(Model model) {
//		session.setAttribute("id", "test1"); 
//		session.setAttribute("nickname", "test1");
//		String addr = myservice.selectaddr((String)session.getAttribute("id"));
//		session.setAttribute("addr", addr);
		//System.out.println(addr);
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
	public String my_medicine(@RequestParam(defaultValue="1") int page, Model model) {
		HashMap<String, Object> map = myservice.selectAll(page);
		
		model.addAttribute("listCount",map.get("listCount"));
		model.addAttribute("maxPage",map.get("maxPage"));
		model.addAttribute("startPage",map.get("startPage"));
		model.addAttribute("endPage",map.get("endPage"));
		model.addAttribute("startRow",map.get("startRow"));
		model.addAttribute("endRow",map.get("endRow"));
		model.addAttribute("page",map.get("page"));
		System.out.println("maxPage : "+map.get("maxPage"));
		
		return "my_medicine";
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
