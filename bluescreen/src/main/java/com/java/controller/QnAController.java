package com.java.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.Page;
import com.java.dto.QnAComment;
import com.java.dto.Questions;
import com.java.service.QnAService;

import jakarta.servlet.http.HttpSession;

@Controller
public class QnAController {
	@Autowired QnAService qnaService;
	@Autowired HttpSession session;
	
	@RequestMapping("/qnaList")
	public String qnaList(Model model, Page page, String text) {
		HashMap<String, Object> map = qnaService.selectAllQnA(page, text);
		model.addAttribute("list",map.get("list"));
		ArrayList<Questions> list = (ArrayList<Questions>) map.get("list");
		model.addAttribute("page",map.get("page"));
		model.addAttribute("text",text);
		return "qna/qnaList";
	}
	
	@GetMapping("/qnaModi")
	public String qnaModi(int qno, Model model) {
		Questions q = qnaService.selectOneQnA(qno);
		model.addAttribute("qna",q);
		return "qna/qnaModi";
	}
	
	@PostMapping("/qnaModi")
	public String qnaModi(Questions qna, @RequestPart MultipartFile file) {
		String fileName ="";
		if(!file.isEmpty()) {
			String ori_file = file.getOriginalFilename();// 실제파일이름
			UUID uuid = UUID.randomUUID();// 랜덤숫자생성
			fileName = uuid+"_"+ori_file; // 최종파일이름
			String uploadUrl = "c:/upload/"; // 파일이저장될위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f);// 파일저장
				qna.setQfile(fileName); // board객체에 file이름저장
			}catch(Exception e) {e.printStackTrace();}
		}
		qnaService.updateQnAOne(qna);
		return "redirect:/qnaList";
	}
	
	
	
	@RequestMapping("/qnaRead")
	public String qnaRead(int qno, Model model) {
		Questions q = qnaService.selectOneQnA(qno);
		qnaService.updateQhitOne(qno);
		Questions prev = qnaService.selectPrevQnA(qno);
		Questions next = qnaService.selectNextQnA(qno);
		ArrayList<QnAComment> qnaCommentList = qnaService.selectAllQnAComment(qno); 
		
		model.addAttribute("qna", q);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("comList", qnaCommentList);
		
		return "qna/qnaRead";
	}
	
	@GetMapping("/qnaWrite")
	public String qnaWrite() {
		return "qna/qnaWrite";
	}
	
	@RequestMapping("/qnaWrite")
	public String doQnaWrite(Questions qna, @RequestPart MultipartFile file) {
		String fileName ="";
		int uno = (int)session.getAttribute("sessionUno");
		qna.setUno(uno);
		if(!file.isEmpty()) {
			String ori_file = file.getOriginalFilename();// 실제파일이름
			UUID uuid = UUID.randomUUID();// 랜덤숫자생성
			fileName = uuid+"_"+ori_file; // 최종파일이름
			String uploadUrl = "c:/upload/"; // 파일이저장될위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f);// 파일저장
			}catch(Exception e) {e.printStackTrace();}
		}
		qna.setQfile(fileName); // board객체에 file이름저장
		qnaService.insertQnA(qna);
		return "redirect:/qnaList";
	}
	
	@RequestMapping("/qnaCommentInsert")
	public String qnaCommentInsert(int qno, String qccontent) {
		qnaService.qnaCommentInsert(qno, qccontent);
		return "redirect:/qnaRead?qno="+qno;
	}
	
	@RequestMapping("/qnaCommentDelete")
	public String qnaCommentDelete(int qcno, int qno) {
		qnaService.qnaCommentDelete(qcno);
		return "redirect:/qnaRead?qno="+qno;
	}
	
	@RequestMapping("/qnaDelete")
	public String qnaDelete(int qno) {
		qnaService.deleteOneQnA(qno);
		return "redirect:/qnaList";
	}
	
}
