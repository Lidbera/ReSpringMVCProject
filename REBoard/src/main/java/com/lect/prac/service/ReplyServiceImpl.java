package com.lect.prac.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lect.prac.domain.ReplyVO;
import com.lect.prac.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {	
	@Inject
	ReplyDAO dao;

	@Override
	public void insert(ReplyVO vo) {
		dao.insert(vo);
	}

	@Override
	public List<ReplyVO> list(int index) {
		return dao.list(index);
	}

	@Override
	public void remove(ReplyVO vo) {
		dao.remove(vo);
	}

	@Override
	public void modify(ReplyVO vo) {
		dao.update(vo);
	}

}
