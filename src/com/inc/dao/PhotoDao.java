package com.inc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.inc.util.MyBatisConnector;
import com.inc.vo.PhotoVo;

public class PhotoDao {
	private static PhotoDao single;
	private SqlSessionFactory factory;

	private PhotoDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	public static PhotoDao getInstance() {
		if (single == null) {
			single = new PhotoDao();
		}
		return single;
	}

	public void insert(PhotoVo pvo) {
		SqlSession session = factory.openSession(true);
		session.insert("photo.insert",pvo);
		session.close();
	}

	public List<PhotoVo> selectList() {
		SqlSession session = factory.openSession();
		List<PhotoVo> pvoList = session.selectList("photo.selectList");
		session.close();
		return pvoList;
	}
	
	
	
}
