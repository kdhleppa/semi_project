package edu.kh.semiproject.map.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MapDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	/*
	public List<allAdressList> allAdressList() {
		return sqlSession.selectList("mapMapper.allAdress");
	}
	*/
}
