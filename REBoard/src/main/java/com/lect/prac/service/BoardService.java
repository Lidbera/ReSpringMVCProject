package com.lect.prac.service;

import java.util.List;

import com.lect.prac.domain.BoardVO;

public interface BoardService {
	public void write(BoardVO vo);
	public List<BoardVO> selectList(int num);
	public BoardVO select(int index);
	public int count();
	public void modify(BoardVO vo);
	public void remove(int index);
}
