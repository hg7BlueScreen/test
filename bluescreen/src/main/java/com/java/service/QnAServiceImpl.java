package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Page;
import com.java.dto.QnAComment;
import com.java.dto.Questions;
import com.java.mapper.QnAMapper;

@Service
public class QnAServiceImpl implements QnAService {
	@Autowired QnAMapper qnaMapper;
	
	@Override
	public HashMap<String, Object> selectAllQnA(Page page, String text) {
		page = pageMethodQnA(page, text);
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<Questions> list = qnaMapper.selectAllQnA(page,text);
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	
	private Page pageMethodQnA(Page pageDto, String text) {
		// 전체 게시글 수 저장
		pageDto.setListCount(qnaMapper.selectListCount(text));
		// 최대 넘버링 페이지
		pageDto.setMaxPage((int) Math.ceil((double) pageDto.getListCount() / 20));
		// 시작 넘버링페이지
		pageDto.setStartPage((int) ((pageDto.getPage() - 1) / 10) * 10 + 1);
		// 끝 넘버링 페이지
		pageDto.setEndPage(pageDto.getStartPage() + 10 - 1);
		// 게시글 시작번호
		pageDto.setStartRow((pageDto.getPage() - 1) * 20 + 1);
		// 게시글 끝나는 번호
		pageDto.setEndRow(pageDto.getStartRow() + 20 - 1);

		return pageDto;
	
	}

	@Override
	public Questions selectOneQnA(int qno) {
		Questions q = qnaMapper.selectOneQnA(qno);
		return q;
	}

	@Override
	public Questions selectPrevQnA(int qno) {
		Questions prev = qnaMapper.selectPrevQnA(qno);
		return prev;
	}

	@Override
	public Questions selectNextQnA(int qno) {
		Questions next = qnaMapper.selectNextQnA(qno);
		return next;
	}

	@Override
	public ArrayList<QnAComment> selectAllQnAComment(int qno) {
		ArrayList<QnAComment> list = qnaMapper.selectAllQnaComment(qno);
		return list;
	}

	@Override
	public void qnaCommentInsert(int qno, String qccontent) {
		qnaMapper.qnaCommentInsert(qno, qccontent);
		qnaMapper.qnaCommentCountUp(qno);
	}

	@Override
	public void qnaCommentDelete(int qcno) {
		qnaMapper.qnaCommentCountDown(qcno);
		qnaMapper.qnaCommentDelete(qcno);
	}

	@Override
	public void updateQnAOne(Questions qna) {
		qnaMapper.updateQnAOne(qna);
	}

	@Override
	public void insertQnA(Questions qna) {
		qnaMapper.insertQnA(qna);
	}

	@Override
	public void updateQhitOne(int qno) {
		qnaMapper.updateQhitOne(qno);
		
	}

	@Override
	public void deleteOneQnA(int qno) {
		qnaMapper.deleteOneQnA(qno);
	}
	

}
