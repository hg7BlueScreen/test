package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class Caution {
	
	private int CautionSeq;
	private int CautionScore;
	private int uno;
	private String CautionReason;
	private Timestamp CautionDate;
	
}
