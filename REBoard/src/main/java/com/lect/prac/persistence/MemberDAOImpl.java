package com.lect.prac.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lect.prac.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sql;
	
	@Override
	public void insert(MemberVO vo) throws Exception {
		if(vo.getId().isEmpty() || vo.getId() == null ||
				vo.getId().length() < 5 || vo.getId().length() > 20) {
			throw new Exception();
		}
		sql.insert("member.insert", vo);
	}

	@Override
	public void update(MemberVO vo) {
		sql.update("member.update", vo);
	}

	@Override
	public MemberVO select(String id) {
		MemberVO dto = new MemberVO();
		dto.setId(id);
		return sql.selectOne("member.select", dto);
	}

	@Override
	public MemberVO select(MemberVO vo) {
		return sql.selectOne("member.select", vo);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		return sql.selectOne("member.login", vo);
	}
}
