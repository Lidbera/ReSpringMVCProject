package com.lect.prac.persistence;

import java.util.List;

import com.lect.prac.domain.ReplyVO;

public interface ReplyDAO {
	public void insert(ReplyVO vo);
	public List<ReplyVO> list(int index);
	public void remove(ReplyVO vo);
	public void update(ReplyVO vo);
}
