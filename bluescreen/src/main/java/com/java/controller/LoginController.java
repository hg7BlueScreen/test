package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.dto.BMember;
import com.java.service.LoginService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	@Autowired HttpSession session;
	@Autowired LoginService loginservice;
	
	@GetMapping("/login")
	public String login(Model model) {
		return "login/login";
	}//	@GetMapping("/login")
	
	@PostMapping("/login")
	public String dologin(BMember bmember,Model model) {
		BMember bmem = loginservice.selectLogin(bmember.getId(), bmember.getPw());
		if(bmem!=null) {
			session.setAttribute("sessionId", bmem.getId());
			session.setAttribute("sessionName", bmem.getName());
			session.setAttribute("sessionUno", bmem.getUno());
			model.addAttribute("loginCk",1);
		}else {
			model.addAttribute("loginCk", 0);	//alert창 띄우기 위한 방법
			return "login/login";
		}//else
		return "redirect:/";
	}//@PostMapping("/login")
	
	@RequestMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
	
	
	
}
