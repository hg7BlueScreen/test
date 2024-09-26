package com.java.controller;


import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;




import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.dto.ScrapNews;

@Controller
public class NewsController {
	
	@RequestMapping("/newsImport")
	public String webtest() {
		// pom에 jsoup 추가 후 사용 
		
		String URL = "http://www.bosa.co.kr/news/articleList.html?sc_section_code=S1N5&view_type=sm";
		List<ScrapNews> scrapers = new ArrayList<>();
        try {
            // timeout을 설정하지 않으면 ReadTimeoutException이 발생할 수 있다.
            Document doc = Jsoup.connect(URL).timeout(50000).get(); 
            Elements elements = doc.select("ul[class=type2]").select("li");
           //System.out.println(elements);
            ScrapNews scrap1 = new ScrapNews();
			  for( Element element : elements ) { 
			  ScrapNews scrap = new ScrapNews();
			  
			  // System.out.println(element);
			  scrap.setImgUrl(element.select("img").attr("src")); // String imgUrl =
			  //element.select("img").attr("data-src");
			  scrap.setTitle(element.select("h4[class=titles]").text()); // String title =
			  //element.select("img").attr("alt");
			  scrap.setUrl("http://www.bosa.co.kr/"+element.select("a").attr("href")); // String purl =
			  //element.select("a").attr("href");
			  String[] emlist = element.select("span[class=byline]").text().split(" ");
			  scrap.setTeam(emlist[0]); // String
			  // content = element.select("div[class=sa_text_lede]").text();
			  scrap.setAnchor(emlist[1]+" "+emlist[2]); // String
			  scrap.setTime(emlist[3]+" "+emlist[4]); // String
			  // press = element.select("div[class=sa_text_press]").text();
			  System.out.println(scrap);
				  if(scrap != null) {
					  scrap1 = scrap;
				  }
			  }
			  
			 
           
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
		return "webtest";
	}

	
}