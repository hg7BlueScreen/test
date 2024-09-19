package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Medicine {
	
	private int mno; // 시퀀스명
	private String entpName; // 회사명
	private String itemName; // 제품명
	private String itemSeq; // 품목기준코드
	private String efcyQesitm; // 효능
	private String useMethodQesitm; // 용법
	private String atpnWarnQesitm; // 복용 전 주의
	private String atpnQesitm; // 복용 시 주의
	private String intrcQesitm; // 복용 중 주의
	private String seQesitm; // 부작용
	private String depositMethodQesitm; // 보관법
	private String imageURL; // 이미지
	private String updateDe; // 업로드 날짜
	private String uno;	
}
