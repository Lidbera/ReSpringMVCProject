package com.lect.prac.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lect.prac.domain.BoardVO;
import com.lect.prac.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Override
	public void write(BoardVO vo) {
		dao.insert(vo);
	}

	@Override
	public List<BoardVO> selectList(int num) {
		return dao.selectList(num);
	}

	@Override
	public BoardVO select(int index) {
		return dao.select(index);
	}

	@Override
	public int count() {
		return dao.count();
	}

	@Override
	public void modify(BoardVO vo) {
		dao.update(vo);
	}
}
