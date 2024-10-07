package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Page;
import com.java.dto.QnAComment;
import com.java.dto.Questions;

@Mapper
public interface QnAMapper {

	int selectListCount(String text);

	ArrayList<Questions> selectAllQnA(Page page, String text);

	Questions selectOneQnA(int qno);

	Questions selectPrevQnA(int qno);

	Questions selectNextQnA(int qno);

	ArrayList<QnAComment> selectAllQnaComment(int qno);

	void qnaCommentInsert(int qno, String qccontent);

	void qnaCommentDelete(int qcno);

	void updateQnAOne(Questions qna);

	void insertQnA(Questions qna);

	void updateQhitOne(int qno);

	void qnaCommentCountUp(int qno);

	void qnaCommentCountDown(int qcno);

	void deleteOneQnA(int qno);

}
