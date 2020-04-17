package com.lect.prac.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int index;
	private String title, content, writer_name, writer_id;
	private Date datetime;
	private String filename;
}