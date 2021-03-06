package kr.ac.assemvely.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.assemvely.dao.CommentDao;
import kr.ac.assemvely.service.CommentService;
import kr.ac.assemvely.vo.CommentVo;
import kr.ac.assemvely.vo.UserVo;

@Service
public class CommentServiceImpl implements CommentService {

	
	@Inject
	CommentDao dao;

	@Override
	public List<CommentVo> c_list(CommentVo commentvo) throws Exception {
		// TODO Auto-generated method stub
		return dao.c_list(commentvo);
	}

	@Override
	public int c_insert(CommentVo commentvo) throws Exception {
		// TODO Auto-generated method stub
		return dao.c_insert(commentvo);
	}

	@Override
	public int c_delete(Integer c_bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.c_delete(c_bno);
	}

	

	@Override
	public int codi_comment(CommentVo commentvo) throws Exception {
		// TODO Auto-generated method stub
		return dao.codi_comment(commentvo);
	}



	@Override
	public List<CommentVo> codi_list(CommentVo commentvo) throws Exception {
		// TODO Auto-generated method stub
		return dao.codi_list(commentvo);
	}


	@Override
	public void insertcomment(CommentVo commentvo) throws Exception {
		dao.insertcomment(commentvo);
		
	}


}
