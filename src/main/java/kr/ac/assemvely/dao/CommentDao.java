package kr.ac.assemvely.dao;

import java.util.List;

import kr.ac.assemvely.vo.CommentVo;
import kr.ac.assemvely.vo.UserVo;

public interface CommentDao {
	public List<CommentVo> c_list(CommentVo commentvo) throws Exception;
	public int c_insert(CommentVo commentvo) throws Exception;
	public int c_delete(Integer c_bno) throws Exception;
	//코디 댓글쓰기
	public int codi_comment(CommentVo commentvo) throws Exception;
	
	//코디 댓글보기
	public List<CommentVo> codi_list(CommentVo commentvo) throws Exception;
	public void insertcomment(CommentVo commentvo) throws Exception;
	}


