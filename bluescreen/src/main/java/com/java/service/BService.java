package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.java.dto.Board;
import com.java.dto.Comment;

public interface BService {

	HashMap<String, Object> selectAll(int page);

	Board selectOne(int bno);

	void insertOne(Board board);

	void deleteOne(int bno);

	void updateOne(Board board);

	void replyOne(Board board);

	HashMap<String, Object> selectOner(int bno, String category, String s_word);

	ArrayList<Comment> selectComAll(int bno);

	Comment commentInsert(Comment comdto);

	void commentDelete(int cno);

	Comment commentUpdate(Comment cdto);

	int comCnt(int bno);

	void updateBhitUp(int bno);


	


	
	

}