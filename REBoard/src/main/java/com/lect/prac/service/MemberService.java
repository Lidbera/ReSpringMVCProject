package com.lect.prac.service;

import com.lect.prac.domain.MemberVO;

public interface MemberService {
	public void register(MemberVO vo) throws Exception;
	public void modify(MemberVO vo);
	public MemberVO select(String id);
	public MemberVO select(MemberVO vo);
	public MemberVO login(MemberVO vo);
}
