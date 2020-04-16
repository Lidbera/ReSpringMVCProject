package com.lect.prac.persistence;

import com.lect.prac.domain.MemberVO;

public interface MemberDAO {
	public void insert(MemberVO vo) throws Exception;
	public void update(MemberVO vo);
	public MemberVO select(String id);
	public MemberVO select(MemberVO vo);
	public MemberVO login(MemberVO vo);
}
