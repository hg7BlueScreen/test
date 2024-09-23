package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class DrugEffect {
	
	private int dno;
	private int item_seq;
	private String article_title;
	private String article_content;
	
}
