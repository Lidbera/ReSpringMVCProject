package com.lect.prac.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lect.prac.domain.MemberVO;
import com.lect.prac.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.insert(vo);
	}

	@Override
	public void modify(MemberVO vo) {
		dao.update(vo);
	}

	@Override
	public MemberVO select(String id) {
		return dao.select(id);
	}

	@Override
	public MemberVO select(MemberVO vo) {
		return dao.select(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}
}
