package com.java.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.java.dto.M_box;
import com.java.service.MService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MapController {
	@Autowired HttpSession session;
	@Autowired MService mservice;
	@RequestMapping("/Mmap")
	public String Mmap(Model model) {
		
		if(session.getAttribute("addr")!=null) { 	//회원 주소값이 있을 때 
			String addr = (String)session.getAttribute("addr"); 
			String[] user_addr = addr.split(" "); //회원 주소 시 / 자치구 분리
			String userAddr = addr.substring(8);
			String[] useraddr = userAddr.split(",");
			//System.out.println(userAddr); System.out.println(useraddr[0]);
			model.addAttribute("addrA",useraddr[0]); 
			model.addAttribute("addrs",user_addr[1].substring(0,2));	//시
			if(user_addr[1].substring(0,2).equals("세종")) {
				model.addAttribute("addrg","특별자치시");	//구
			}else {
				model.addAttribute("addrg",user_addr[2]);	//구
			}
			//System.out.println(user_addr[1]); System.out.println(user_addr[2]);
		}
		return "Mmap";
	}
	@PostMapping("/mBoxgu")
	@ResponseBody
	public ArrayList<M_box> mBoxgu(M_box m_box, Model model){
		//System.out.println(m_box.getGu());
		ArrayList<M_box> mbox = mservice.selectMBoxGu(m_box);
		model.addAttribute("name",m_box.getName());
		model.addAttribute("addr",m_box.getAddr());
		model.addAttribute("phone",m_box.getPhone());
		model.addAttribute("x",m_box.getX());
		model.addAttribute("y",m_box.getY());
		return mbox;
	}

}
