package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BMember {
	private int uno; 
	private String id; 
	private String pw; 
	private String name; 
	private String nickName; 
	private String gender; 
	private String address; 
	private String email; 
	private String phone; 
	private Timestamp birthday; 
	private String socialNum; 
	private String socialKey; 
	private String job; 
	private int caucount; 
	private String leavereason; 
	private Timestamp leavedate; 
	private String ck;
}
