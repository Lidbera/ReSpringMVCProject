package com.lect.prac.service;

import java.util.List;

import com.lect.prac.domain.ReplyVO;

public interface ReplyService {
	public void insert(ReplyVO vo);
	public List<ReplyVO> list(int index);
	public void remove(ReplyVO vo);
	public void modify(ReplyVO vo);
}
