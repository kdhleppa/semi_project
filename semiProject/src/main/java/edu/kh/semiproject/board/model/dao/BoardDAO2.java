package edu.kh.semiproject.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO2 {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}
