package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class Caution {
	
	private int cautionSeq;
	private int cautionScore;
	private int uno;
	private String cautionReason;
	private Timestamp cautionDate;
	
}
