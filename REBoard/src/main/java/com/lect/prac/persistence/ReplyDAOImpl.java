package com.lect.prac.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lect.prac.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Inject
	SqlSession sql;

	@Override
	public void insert(ReplyVO vo) {
		sql.insert("reply.insert", vo);
	}

	@Override
	public List<ReplyVO> list(int index) {
		ReplyVO vo = new ReplyVO();
		vo.setBoardindex(index);
		return sql.selectList("reply.list", vo);
	}

	@Override
	public void remove(ReplyVO vo) {
		sql.update("reply.remove", vo);
	}

	@Override
	public void update(ReplyVO vo) {
		sql.update("reply.modify", vo);
	}
}
