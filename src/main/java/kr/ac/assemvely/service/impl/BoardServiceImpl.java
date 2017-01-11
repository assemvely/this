package kr.ac.assemvely.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.assemvely.dao.BoardDao;
import kr.ac.assemvely.service.BoardService;
import kr.ac.assemvely.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDao dao;

	@Override
	public void create(BoardVo vo) throws Exception {
		dao.create(vo);
		
	}

	@Override
	public BoardVo read(Integer bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public List<BoardVo> listall() throws Exception {
		return dao.listall();
	}

	@Override
	public void delete(Integer bno) throws Exception {
		dao.delete(bno);
		
	}

	@Override
	public void update(BoardVo vo) throws Exception {
		dao.update(vo);
		
	}

	@Override
	public int countcodi() throws Exception {
		return dao.countcodi();
	}

	@Override
	public int countitem() throws Exception {
		// TODO Auto-generated method stub
		return dao.countitem();
	}

}
