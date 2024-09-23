package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Drug {
	
	private int dno;
	private int	item_seq;
	private int	entp_seq;
	private String item_name;
	private String entp_name;
	private String etc_otc_code;
	private String chart;
	private String material_name;
	private String storage_method;
	private String valid_term;
	private String main_item_ingr;
	private String ingr_name;
	private String atc_code;
	private String imageURL;
	private Timestamp item_permit_date;
	private String defendOverInsert;
}
