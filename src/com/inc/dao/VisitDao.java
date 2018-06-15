package com.inc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.inc.util.MyBatisConnector;
import com.inc.vo.VisitVo;

public class VisitDao {
	private static VisitDao single;
	
	private SqlSessionFactory factory;
	
	private VisitDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	public static VisitDao getInstance() {
		if (single == null) {
			single = new VisitDao();
		}
		return single;
	}

	public List<VisitVo> SelectList() {
		SqlSession session = factory.openSession();
		List<VisitVo> visitVo = session.selectList("visit.selectList");
		
		session.close();
		return visitVo;
		
	}

	public void insert(VisitVo vvo) {
		SqlSession session = factory.openSession(true);
		session.insert("visit.insert",vvo);
		session.close();
	}

	public void delete(int id) {
		SqlSession session = factory.openSession(true);
		session.insert("visit.delete",id);
		session.close();
	}
	
	
}
