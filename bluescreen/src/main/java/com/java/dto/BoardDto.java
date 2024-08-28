package com.java.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
	public class BoardDto {
		
		private Long id;
		private String bWriter;
		private String bTitle;
		private String bContent;
		private int bHit;
		private LocalDateTime boardCreatedTime;
		private LocalDateTime boardUpdateTime;
	
	
	
}
