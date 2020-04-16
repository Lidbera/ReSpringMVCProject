package com.lect.prac.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lect.prac.domain.BoardVO;

import util.Log;

@Repository
public class BoardDAOImpl implements BoardDAO {
	private final String mapper = "board.";
	
	@Inject
	SqlSession sql;
	
	@Override
	public void insert(BoardVO vo) {
		sql.insert(mapper + "insert", vo);
	}
	
	@Override
	public List<BoardVO> selectList(int num) {
		num = 1 + ((num - 1) * 10);
		return sql.selectList(mapper + "select_list", num);
	}

	@Override
	public BoardVO select(int index) {
		BoardVO vo = new BoardVO();
		vo.setIndex(index);
		return sql.selectOne(mapper + "select", vo);
	}
	
	@Override
	public int count() {
		int count =  sql.selectOne(mapper + "count");
		int pag = count / 10;
		int res = count % 10;
		if(res > 0){
			pag++;
		}
		return pag;
	}
	
	@Override
	public void update(BoardVO vo) {
		sql.update(mapper + "update", vo);
	}
}
