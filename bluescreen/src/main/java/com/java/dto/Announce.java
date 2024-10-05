package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Announce {
	
	private int ano;
	private String atitle;
	private String acontent;
	private Timestamp adate;
	
}
