package com.lect.prac.domain;

import lombok.Data;

@Data
public class ReplyVO {
	private int boardindex, num;
	private String writer, content;
}
