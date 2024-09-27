package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Timestamp;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	private int bno;
	private String id;
	private String btitle;
	private String bcontent;
	private Timestamp bdate;
	private int bhit;
	private int bgroup;
	private int bstep;
	private int bindent;
	private String bfile;
	private int prevNum; //이전글의 글번호
	private int nextNum; //다음글의 글번호
	private String prevTitle; //이전글의 제목
	private String nextTitle; //다음글의 제목
	private int comcnt;

}