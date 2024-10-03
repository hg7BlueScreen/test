package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class Complain {
	
	private int cno;
	private int no;
	private String cid;
	private String sid;
	private int division;
	private String creason;
	private Timestamp cdate;
	private String nickname;
	private int bno;
	
}
