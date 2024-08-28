package com.java.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.dto.BoardDto;
import com.java.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/board")
@Controller
public class Bcontroller {
	// 게시글 보기
	@RequestMapping("/board/notice_read")
	public String notice_read() {
		return "Board/board/notice_read";	
	}
	// 게시글 작성
	@RequestMapping("/board/write")
	public String write() {
		return "Board/board/write";	
	}
	// 게시글 리스트
	@GetMapping("/")
	public String findAll(Model model) {
		
		return "Board/board/Ldictionary";
	}
	
}
