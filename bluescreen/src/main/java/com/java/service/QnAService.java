package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.java.dto.Page;
import com.java.dto.QnAComment;
import com.java.dto.Questions;

public interface QnAService {

	HashMap<String, Object> selectAllQnA(Page page, String text);

	Questions selectOneQnA(int qno);

	Questions selectPrevQnA(int qno);

	Questions selectNextQnA(int qno);

	ArrayList<QnAComment> selectAllQnAComment(int qno);

	void qnaCommentInsert(int qno, String qccontent);

	void qnaCommentDelete(int qcno);

	void updateQnAOne(Questions qna);

	void insertQnA(Questions qna);

	void updateQhitOne(int qno);

	void deleteOneQnA(int qno);

}
