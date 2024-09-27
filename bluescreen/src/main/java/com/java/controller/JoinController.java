package com.java.controller;

import java.security.Timestamp;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.Member;
import com.java.service.JoinService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/join")
public class JoinController {
	@Autowired JoinService jservice;
	@Autowired HttpSession session;
	
	@RequestMapping("/join1")
	public String join1() {
		return "join/join1";
	}
	
	
	@PostMapping("/join2")
	public String join2(Member join) {
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
	public String join3(Member join) {
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
	@RequestMapping("/modify")
	public String modify(Model model) {
		String id = (String)session.getAttribute("sessionId"); 
		Member member = jservice.selectAll(id);
		String[] aEmail = member.getEmail().split("@");
		String emailId = aEmail[0];	String emailTail = aEmail[1];
		member.setEmailId(emailId);	member.setEmailTail(emailTail);
		String addr1 = member.getAddress().substring(1,6);
		String[] adr = member.getAddress().substring(8).split(",");
		String addr2 = adr[0];	String addr3 = adr[1];
		member.setAddr1(addr1);	member.setAddr2(addr2);	member.setAddr3(addr3);
		String[] phn = member.getPhone().split("-");
		String phone2 = phn[1];	String phone3 = phn[2];
		member.setPhone2(phone2);
		member.setPhone3(phone3);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String bhday = format.format(member.getBirthday());
		String[] bday = bhday.split("-");
		String year = bday[0];String month = bday[1];String day = bday[2];
		member.setYear(year);member.setMonth(month);member.setDay(day);
		
		
		model.addAttribute("mem",member);
		return "join/modify";
	}
	@GetMapping("/myInformation")
	public String myInformation(Model model) {
		String id = (String)session.getAttribute("sessionId"); 
		Member member = jservice.selectAll(id);
		model.addAttribute("mem",member);
		return "join/myInformation";
	}
	@PostMapping("/myInformation")
	public String domyInformation(Member member, String pw1, Model model) {
		String phone = member.getPhone1()+"-"+member.getPhone2()+"-"+member.getPhone3();
		String address = "("+member.getAddr1()+") "+member.getAddr2()+", "+member.getAddr3();
		String email = member.getEmailId()+"@"+member.getEmailTail();
		String birthday = member.getYear()+"-"+member.getMonth()+"-"+member.getDay();
		Date date = Date.valueOf(birthday);
		member.setPhone(phone);
		member.setAddress(address);
		member.setEmail(email);
		member.setBirthday(date);
		if(pw1 != null) {
			member.setPw(pw1);
		}
		jservice.updateUser(member);
		System.out.println(member.getUno());
		String id = (String)session.getAttribute("sessionId"); 
		Member mem = jservice.selectAll(id);
		model.addAttribute("mem",mem);
		return "join/myInformation";
	}
	
}
	
