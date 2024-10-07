package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Questions {
	
	private int qno;
	private String isAnswer;
	private String qfile;
	private String qcontent;
	private String qtitle;
	private Timestamp qdate;
	private int uno;
	private int qhit;
	private String id;
	private int comCount;
	
}
