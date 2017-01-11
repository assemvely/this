package kr.ac.assemvely.dao;

import java.util.List;

import kr.ac.assemvely.vo.BoardVo;

public interface BoardDao {
	
	public void create(BoardVo vo)throws Exception;
	public BoardVo read(Integer bno)throws Exception;
	public List<BoardVo> listall() throws Exception;
	public void delete(Integer bno)throws Exception;
	public void update (BoardVo vo)throws Exception;
	public int countcodi();
	public int countitem();

}
