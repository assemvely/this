package kr.ac.assemvely.service;

import java.util.List;

import kr.ac.assemvely.vo.CommentVo;
import kr.ac.assemvely.vo.UserVo;

public interface CommentService {
	public List<CommentVo> c_list(CommentVo commentvo) throws Exception;
	public int c_insert(CommentVo commentvo) throws Exception;
	public int c_delete(Integer c_bno) throws Exception;
	public List<UserVo> c_list_img(CommentVo commentvo) throws Exception;

}
