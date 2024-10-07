package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class QnAComment {
	
	private int qcno;
	private String qccontent;
	private Timestamp qcdate;
	private int qno;
	
	
}
