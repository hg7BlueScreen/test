package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.java.dto.Board;
import com.java.dto.Comment;
import com.java.mapper.BMapper;

@Service
public class BServiceImpl implements BService {

	@Autowired BMapper bMapper;
	@Override
	public HashMap<String, Object> selectAll(int page) {
		HashMap<String, Object> map = new HashMap<>();
		// 1. 총 게시글의 수 
		int listCount = bMapper.selectListCount();
		// 2. 최대페이지 
		int maxPage = (int)Math.ceil(listCount/10.0);
		// 3. startPage, endPage 
		int startPage = (int)((page-1)/10)*10+1;
		int endPage = startPage+10-1;
		// 4. startRow, endRow 
		int startRow = (page-1)*10+1;
		int endRow = startRow+10-1;
		if(endPage > maxPage) endPage=maxPage;
		
		ArrayList<Board> list = bMapper.selectAll(startRow,endRow);
		
		for(int i = 0 ; i <list.size(); i++) {
			list.get(i).setComcnt(bMapper.comCnt(list.get(i).getBno()));	
		}
		
		map.put("listCount", listCount);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("list", list);
		map.put("page", page);
		
		return map;
	}
	@Override
	public Board selectOne(int bno) {
		Board b = bMapper.selectOne(bno);
		return b;
	}
	@Override
	public void insertOne(Board board) {
		bMapper.insertOne(board);
	}
	@Override
	public void deleteOne(int bno) {
		bMapper.deleteOne(bno);
	}
	@Override
	public void updateOne(Board board) {
		bMapper.updateOne(board);
	}
	@Override
	public void replyOne(Board board) {
		// 1. 답글게시글을 추가하는 부분
		bMapper.insertReplyOne(board);
		// 2. bstep 조정하는 부분
		bMapper.updateBstepCount(board);
		
	}
	@Override
	public HashMap<String, Object> selectOner(int bno, String category, String s_word) {
		HashMap<String, Object> map = new HashMap<>(); 
		Board board = bMapper.selectOner(bno);
		Board prev = bMapper.selectPrev(bno, category, s_word);
		Board next = bMapper.selectNext(bno, category, s_word);
		map.put("board", board);
		map.put("prev", prev);
		map.put("next", next);
		return map;
	}
	@Override
	public ArrayList<Comment> selectComAll(int bno) {
		ArrayList<Comment> list = bMapper.selectComAll(bno);
		return list;
	}
	@Override
	public Comment commentInsert(Comment comdto) {
		System.out.println("before");
		System.out.println("bservice cno : "+ comdto.getCno());
		System.out.println("bservice id : "+ comdto.getId());
		System.out.println("bservice cdate : "+ comdto.getCdate());
		bMapper.commentInsert(comdto);
		System.out.println("after");
		System.out.println("bservice cno : "+ comdto.getCno());
		System.out.println("bservice id : "+ comdto.getId());
		System.out.println("bservice cdate : "+ comdto.getCdate());
		
		// 하단 댓글1개 가져오기 
		Comment cdto = bMapper.selectComOne(comdto);
		return cdto;
	}
	@Override
	public void commentDelete(int cno) {
		bMapper.commentDelete(cno); 
	}
	
	@Override
	public Comment commentUpdate(Comment cdto) {
		// 하단댓글 수정저장 
		// 수정내용 업데이트하기
		bMapper.commentUpdate(cdto);
		// 내용가져오기 
		Comment comment = bMapper.selectComOne(cdto);
		return comment;
	}
	@Override
	public int comCnt(int bno) {
		int ccnt = bMapper.comCnt(bno);
		return ccnt;
	}
	@Override
	public void updateBhitUp(int bno) {
		bMapper.updateBhitUp(bno);
		
	}


}


