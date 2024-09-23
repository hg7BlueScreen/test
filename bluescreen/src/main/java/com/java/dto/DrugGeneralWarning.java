package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class DrugGeneralWarning {
	
	private int dno;
	private int item_seq;
	private String text;
	
}
