package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Board;
import com.java.dto.Comment;

@Mapper
public interface BMapper {

	ArrayList<Board> selectAll(int startRow, int endRow, String text);

	Board selectOne(int bno);

	void insertOne(Board board);

	void deleteOne(int bno);

	void updateOne(Board board);

	void insertReplyOne(Board board);

	void updateBstepCount(Board board);

	int selectListCount(String text);
	
	// bno번 게시글 가져오기 
		Board selectOner(int bno);
		// bno의 이전 글 가져오기 
		Board selectPrev(int bno, String category, String s_word);
		// bno의 이후 글 가져오기 
		Board selectNext(int bno, String category, String s_word);

		ArrayList<Comment> selectComAll(int bno);

		void commentInsert(Comment comdto);

		void commentDelete(int cno);

		void commentUpdate(Comment cdto);

		Comment selectComOne(Comment comdto);

		int comCnt(int bno);

		void updateBhitUp(int bno);

		int selectBoardcount(String id);

		



	
	

}