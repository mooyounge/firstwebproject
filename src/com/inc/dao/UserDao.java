package com.inc.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.inc.util.MyBatisConnector;
import com.inc.vo.UserVo;

public class UserDao {
	private static UserDao single;
	private SqlSessionFactory factory;
	private UserDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}

	public static UserDao getInstance() {
		if (single == null) {
			single = new UserDao();
		}
		return single;
	}

	public void insert(UserVo uvo) {
		SqlSession session = factory.openSession(true);
		session.insert("user.insert",uvo);
		session.close();
	}

	public UserVo selectOne(String id) {
		SqlSession session = factory.openSession();
		UserVo uservo = null;
		uservo = session.selectOne("user.selectOne",id);
		session.close();
		return uservo;
	}

	public int getId(String id) {
		SqlSession session = factory.openSession();
		int count = -1;
		count = session.selectOne("user.countId",id);
		return count;
	}
	
	
}
