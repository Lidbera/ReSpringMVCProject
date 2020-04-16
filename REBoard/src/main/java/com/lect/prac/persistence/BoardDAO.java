package com.lect.prac.persistence;

import java.util.List;

import com.lect.prac.domain.BoardVO;

public interface BoardDAO {
	public void insert(BoardVO vo);
	public List<BoardVO> selectList(int num);
	public BoardVO select(int index);
	public int count();
	public void update(BoardVO vo);
}
