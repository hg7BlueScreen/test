package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class M_box {
	private int seq;
	private double x, y;
	private String name, addr, phone, base_date, gu;
	
}
