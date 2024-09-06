package com.java.dto;

import java.security.Timestamp;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Join {
	private int uno;
	
	private String id;
	private String pw;
	private String name;
	private String nickName;
	private String gender;

	private String socialNum;	//소셜 넘버
	private String socialKey;	//소셜 키	
	private String job;	//직업
	private String ck;	//선택 동의사항 동의 여부
	
	private int caucount;	//경고점수
	private String leavereason;	//탈퇴사유
	private Timestamp leavedate;	//탈퇴일자
	
	private String email;	//이메일
	private String mailId;
	private String mailTail;
	
	private String phone;	//전화번호
	private String phone1;
	private String phone2;
	private String phone3;
	
	private String address;	//주소
	private String addr1;
	private String addr2;
	private String addr3;
	
	private Date birthday;	//생년월일
	private String year;
	private String month;
	private String day;
	
}
