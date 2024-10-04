package com.java.controller;

import java.io.File;
import java.sql.Date;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

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
import com.java.dto.Drug;
import com.java.dto.Medicine;
import com.java.dto.Member;
import com.java.dto.Page;
import com.java.service.BService;
import com.java.service.DrugService;
import com.java.service.JoinService;
import com.java.service.MyService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class BController {
	@Autowired HttpSession session;
	@Autowired BService bservice; 
	@Autowired JoinService jservice;
	@Autowired MyService myservice;
	@Autowired DrugService drugService;
	
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
	public String blist(@RequestParam(defaultValue = "1")int page,Model model, String text) {
		
		HashMap<String, Object> map = bservice.selectAll(page, text);
		
		model.addAttribute("listCount",map.get("listCount"));
		model.addAttribute("maxPage",map.get("maxPage"));
		model.addAttribute("startPage",map.get("startPage"));
		model.addAttribute("endPage",map.get("endPage"));
		model.addAttribute("startRow",map.get("startRow"));
		model.addAttribute("endRow",map.get("endRow"));
		model.addAttribute("page",map.get("page"));
		model.addAttribute("list",map.get("list"));
		
		System.out.println(map.get("listCount"));
		System.out.println(map.get("maxPage"));
		System.out.println(map.get("startPage"));
		System.out.println(map.get("endPage"));
		System.out.println(map.get("startRow"));
		System.out.println(map.get("endRow"));
		System.out.println(map.get("page"));
		System.out.println(map.get("list"));
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
		return "member/modify";
	}
	@GetMapping("/myPageFix")
	public String myInformation(Model model) {
		String id = (String)session.getAttribute("sessionId"); 
		Member member = jservice.selectAll(id);
		model.addAttribute("mem",member);
		return "board/myPageFix";
	}
	@PostMapping("/myPageFix")
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
		return "/board/myPageFix";
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
	@RequestMapping("/myPageFind")
	public String myPageFind(Model model, Page pageDto) {
		int onlyBookMark = 1;
		int uno = -1;
		String textBox = "";
		String categoryDetail = "";
		if (session.getAttribute("sessionId") == null) {
			return "/board/myPageFind";
		} else {
			String id = (String) session.getAttribute("sessionId");
			Member user = myservice.selectUser(id);
			uno = user.getUno();
		}
		
		HashMap<String, Object> map = drugService.selectAllDrugs(pageDto, textBox, categoryDetail, uno, onlyBookMark);
		
		model.addAttribute("list", map.get("list"));
		ArrayList<Drug> list = (ArrayList<Drug>) map.get("list");
		System.out.println(list.size());
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("textBox", textBox);
		model.addAttribute("onlyBookMark", onlyBookMark);
		model.addAttribute("bookMarkListDrug", map.get("bookMarkList"));

		return "/board/myPageFind";
	}
	
	@PostMapping("/deleteBookMarkListFromMyPage")
	@ResponseBody
	public String deleteBookMarkListFromMyPage(String dno[], String uno) {
		 drugService.deleteBookMarkListFromMyPage(dno, uno);
		return "성공";
	}
	
	@PostMapping("/commentCnt")
	@ResponseBody
	public int commentCnt(int bno) {
		int ccnt = bservice.comCnt(bno);
		return ccnt;
	}
	
	
	
}