package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/join")
public class JoinController {
	@RequestMapping("/join1")
	public String join1() {
		return "join/join1";
	}
	@RequestMapping("/join2")
	public String join2() {
		return "join/join2";
	}
	@RequestMapping("/join3")
	public String join3() {
		return "join/join3";
	}
}
