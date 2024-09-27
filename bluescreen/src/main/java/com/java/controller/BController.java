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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.Board;
import com.java.dto.Comment;
import com.java.service.BService;

@Controller
@RequestMapping("/board")
public class BController {

	@Autowired BService bservice; 
	
	@PostMapping("/commentInsert")
	@ResponseBody
	public Comment commentInsert(Comment comdto) {
		// comdto jsp에서 전달받은 값
		System.out.println(comdto.getCcontent());
		System.out.println(comdto.getId());
		// 새로 dto를 만들어서 jsp전송할 값 > data 
		Comment cdto = bservice.commentInsert(comdto);
		return cdto;
	}
	@PostMapping("/commentDelete")
	@ResponseBody
	public String commentDelete(int cno) {
		System.out.println("cno: "+cno);
		bservice.commentDelete(cno);
		return "댓글이 삭제되었습니다.";
	}
	@PostMapping("/commentUpdate")
	@ResponseBody
	public Comment commentUpdate(Comment cdto) {
		System.out.println("cno: "+cdto.getCno());
		System.out.println("cpw: "+cdto.getCpw());
		System.out.println("ccontent: "+cdto.getCcontent());
		Comment comment = bservice.commentUpdate(cdto);
 		return comment;
	}
	
	@RequestMapping("/blist")
	public String blist(@RequestParam(defaultValue = "1")int page,Model model) {
		
		HashMap<String, Object> map = bservice.selectAll(page);
		
		model.addAttribute("listCount",map.get("listCount"));
		model.addAttribute("maxPage",map.get("maxPage"));
		model.addAttribute("startPage",map.get("startPage"));
		model.addAttribute("endPage",map.get("endPage"));
		model.addAttribute("startRow",map.get("startRow"));
		model.addAttribute("endRow",map.get("endRow"));
		model.addAttribute("page",map.get("page"));
		model.addAttribute("list",map.get("list"));
		
		return "/board/blist";
	}
	@RequestMapping("/bread")
	public String bread(int bno, String category, String s_word, Model model) {
		// 확인용
		System.out.println("bno : " + bno);
		Board board = bservice.selectOne(bno);
		bservice.updateBhitUp(bno);
		// 확인용
		System.out.println(board.getBtitle());
		model.addAttribute("board",board);
		HashMap<String, Object> map = bservice.selectOner(bno,category,s_word);
		ArrayList<Comment> comList = bservice.selectComAll(bno);
		// 게시글에 있는 댓글 
				model.addAttribute("comList",comList);
				// 현재 게시글
				model.addAttribute("board", map.get("board"));
				// 이전 게시글
				model.addAttribute("prev", map.get("prev"));
				// 이후 게시글 
				model.addAttribute("next", map.get("next"));
				
				model.addAttribute("category", category);
				model.addAttribute("s_word", s_word);
		//		model.addAttribute("page", page);
				
				
		return "board/bread";
	}
	
	
	@GetMapping("/bwrite")
	public String bwrite() {
		
		return "board/bwrite";
	}
	@PostMapping("/bwrite")
	public String dobwrite(Board board, @RequestPart MultipartFile file) {
		String fileName ="";
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
		board.setBfile(fileName); // board객체에 file이름저장
		
		// 확인용
		//System.out.println(board.getBfile());
	
		//System.out.println("bwrite - fileName : "+ board.getBfile());
		bservice.insertOne(board);
		return "redirect:blist";
	}
	
	
	
	@RequestMapping("/bdelete")
	public String bdelete(int bno) {
		System.out.println("delete bno: "+bno);
		
		bservice.deleteOne(bno);
		
		return "redirect:blist";
	}
	
	
	@GetMapping("/bmodi")
	public String bmodi(int bno, Model model) {
		System.out.println("bmodi bno : "+ bno);
		Board board = bservice.selectOne(bno); 
		model.addAttribute("board",board);
		return "board/bmodi";
	}
	
	@PostMapping("/bmodi")
	public String dobmodi(Board board, @RequestPart MultipartFile file) {
		String fileName ="";
		if(!file.isEmpty()) {
			String ori_file = file.getOriginalFilename();// 실제파일이름
			UUID uuid = UUID.randomUUID();// 랜덤숫자생성
			fileName = uuid+"_"+ori_file; // 최종파일이름
			String uploadUrl = "c:/upload/"; // 파일이저장될위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f);// 파일저장
			}catch(Exception e) {e.printStackTrace();}
			board.setBfile(fileName); // board객체에 file이름저장
		}
		bservice.updateOne(board);
		return "redirect:blist";
	}
	
	@GetMapping("/breply")
	public String breply(int bno, Model model) {
		System.out.println("breply bno : "+ bno);
		Board board = bservice.selectOne(bno); 
		model.addAttribute("board",board);
		return "board/breply";
	}
	
	@PostMapping("/breply")
	public String dobreply(Board board, @RequestPart MultipartFile file) {
//		System.out.println("bno : "+ board.getBno());
//		System.out.println("bgroup: " + board.getBgroup());
//		System.out.println("bindent:  "+ board.getBindent());
//		System.out.println("bstep: " + board.getBstep());
	
		String fileName ="";
		if(!file.isEmpty()) {
			String ori_file = file.getOriginalFilename();// 실제파일이름
			UUID uuid = UUID.randomUUID();// 랜덤숫자생성
			fileName = uuid+"_"+ori_file; // 최종파일이름
			String uploadUrl = "c:/upload/"; // 파일이저장될위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f);// 파일저장
			}catch(Exception e) {e.printStackTrace();}
			board.setBfile(fileName); // board객체에 file이름저장
		}
		bservice.replyOne(board);
		return "redirect:blist";
	}
	
	@RequestMapping("/faq")
	public String faq() {
		return "/board/faq";
	}
	@RequestMapping("/faq2")
	public String faq2() {
		return "/board/faq2";
	}
	@RequestMapping("/faqMedi")
	public String faqMedi() {
		return "/board/faqMedi";
	}
	@RequestMapping("/faqTec")
	public String faqTec() {
		return "/board/faqTec";
	}
	@RequestMapping("/faqUser")
	public String faqUser() {
		return "/board/faqUser";
	}
	@RequestMapping("/fu")
	public String fu() {
		return "/board/fu";
	}
	@RequestMapping("/fudel")
	public String fudel() {
		return "/board/fudel";
	}
	@RequestMapping("/myPage")
	public String myPage() {
		return "/board/myPage";
	}
	@RequestMapping("/myPageMedi")
	public String myPageMedi() {
		return "/board/myPageMedi";
	}
	@RequestMapping("/myPageFind")
	public String myPageFind() {
		return "/board/myPageFind";
	}
	@RequestMapping("/myPageFix")
	public String myPageFix() {
		return "/board/myPageFix";
	}
	
	@PostMapping("/commentCnt")
	@ResponseBody
	public int commentCnt(int bno) {
		int ccnt = bservice.comCnt(bno);
		return ccnt;
	}
	
	
	
}