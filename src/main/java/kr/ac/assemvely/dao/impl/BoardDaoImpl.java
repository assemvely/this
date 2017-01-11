package kr.ac.assemvely.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.assemvely.dao.BoardDao;
import kr.ac.assemvely.vo.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Inject
	private SqlSession sqlsession;
	
	private static String namespace = "kr.ac.assemvely.mappers.boardMapper";

	@Override
	public void create(BoardVo vo) throws Exception {
		sqlsession.insert(namespace + ".create", vo);

	}

	@Override
	public BoardVo read(Integer bno) throws Exception {
		return sqlsession.selectOne(namespace + ".read", bno);
	}

	@Override
	public List<BoardVo> listall() throws Exception {
		return sqlsession.selectList(namespace + ".listall");
	}

	@Override
	public void delete(Integer bno) throws Exception {
		sqlsession.delete(namespace + ".delete", bno);

	}

	@Override
	public void update(BoardVo vo) throws Exception {
		sqlsession.update(namespace + ".update", vo);

	}

	@Override
	public int countcodi() {
		return sqlsession.selectOne(namespace+ ".countcodi");
	}

	@Override
	public int countitem() {
		return sqlsession.selectOne(namespace+ ".countitem");
	}

}