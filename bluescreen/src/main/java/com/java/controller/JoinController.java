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
	
	
	@PostMapping("/join2")
	public String join2(Join join) {
		//System.out.println(join.getCk());
		return "join/join2";
	}
	
	@PostMapping("/idOk")
	@ResponseBody
	public String idOk(String id) {
		//System.out.println(id);
		String name = jservice.idCheck(id);
		return name;
	}
	@PostMapping("/nicknameOk")
	@ResponseBody
	public String nicknameOk(String nickname) {
		//System.out.println(id);
		String nName = jservice.nicknameCheck(nickname);
		return nName;
	}

	@PostMapping("/join3")
	public String join3(Join join) {
		String phone = join.getPhone1()+"-"+join.getPhone2()+"-"+join.getPhone3();
		String address = "("+join.getAddr1()+") "+join.getAddr2()+", "+join.getAddr3();
		String email = join.getEmailId()+"@"+join.getEmailTail();
		String birthday = join.getYear()+"-"+join.getMonth()+"-"+join.getDay();
		Date date = Date.valueOf(birthday);
		join.setPhone(phone);
		join.setAddress(address);
		join.setEmail(email);
		join.setBirthday(date);
		jservice.insertMember(join);
		//System.out.println(join.getId());
		//System.out.println(join.getAddress()); //
		//System.out.println(join.getPw());
		//System.out.println(join.getNickname());
		//System.out.println(join.getEmail());	
		//System.out.println(join.getPhone());	//
		//System.out.println(join.getBirthday());	//
		//System.out.println(join.getName());
		//System.out.println(join.getGender());
		//System.out.println(join);
		return "join/join3";
	}

	
	@PostMapping("/emailSend")
	@ResponseBody
	public String emailSend(String name, String email) {
//		System.out.println("이름 : "+name);
//		System.out.println("메일주소 : "+email);
		String pwCode = jservice.getCode(name, email);
		return pwCode;
	}
}
	
