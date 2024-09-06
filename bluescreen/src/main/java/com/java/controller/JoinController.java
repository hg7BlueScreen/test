package com.java.controller;

import java.security.Timestamp;
import java.sql.Date;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.Join;
import com.java.service.JoinService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
@RequestMapping("/join")
public class JoinController {
	@Autowired JoinService jservice;
	
	@RequestMapping("/join1")
	public String join1() {
		return "join/join1";
	}
	
	
	@GetMapping("/join2")
	public String join2(Join join) {
		System.out.println(join.getCk());
		return "join/join2";
	}
	
	@PostMapping("/idOk")
	@ResponseBody
	public String idOk(String id) {
		//System.out.println(id);
		String name = jservice.idCheck(id);
		return name;
	}
	@PostMapping("/nickNameOk")
	@ResponseBody
	public String nickNameOk(String nickName) {
		//System.out.println(id);
		String nName = jservice.nickNameOk(nickName);
		return nName;
	}
	@PostMapping("/join3")
	public String dojoin2(Join join, Model model) {
//		System.out.println(join.getId());
//		System.out.println(join.getName());
//		System.out.println(join.getPw());
//		System.out.println(join.getMailId());
//		System.out.println(join.getMailTail());
//		System.out.println(join.getAddr1());
//		System.out.println(join.getAddr2());
//		System.out.println(join.getAddr3());
//		System.out.println(join.getPhone1());
//		System.out.println(join.getPhone2());
//		System.out.println(join.getPhone3());
		String phone = join.getPhone1()+"-"+join.getPhone2()+"-"+join.getPhone3();
		String address = "("+join.getAddr1()+") "+join.getAddr2()+", "+join.getAddr3();
		String email = join.getMailId()+"@"+join.getMailTail();
		String birthday = join.getYear()+"-"+join.getMonth()+"-"+join.getDay();
		Date date = Date.valueOf(birthday);
		join.setPhone(phone);
		join.setAddress(address);
		join.setEmail(email);
		join.setBirthday(date);
		jservice.insertMember(join);
		
		int uno = jservice.selectUno(join);
		
		model.addAttribute("uno",uno);
	
		return "join/join3";
	}

	@RequestMapping("/join3")
	public String join3(Join user) {
		
		System.out.println(user.getUno());
		//시퀀스인 사람에게 의료정보가 넘어가게
		return "join/join3";
	}
	@RequestMapping("/join4")
	public String join4(Join user) {
		
		System.out.println(user.getUno());
		//시퀀스인 사람에게 의료정보가 넘어가게
		return "join/join4";
	}
	@PostMapping("/disease")
	@ResponseBody
	public String disease() {
		
		return "성공";
	}
}
