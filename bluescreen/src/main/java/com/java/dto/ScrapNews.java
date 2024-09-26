package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ScrapNews {
	
	private String title;
	private String imgUrl;
	private String url;
	private String team;
	private String anchor;
	private String time;
	
	
}
