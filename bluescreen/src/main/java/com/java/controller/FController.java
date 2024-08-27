package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FController {
	
	@RequestMapping("/")
	public String index() {
		return "index";	
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
