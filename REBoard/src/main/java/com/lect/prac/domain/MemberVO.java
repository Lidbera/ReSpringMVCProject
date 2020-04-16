package com.lect.prac.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String id, pw, name;
	private Date regidate;
}
