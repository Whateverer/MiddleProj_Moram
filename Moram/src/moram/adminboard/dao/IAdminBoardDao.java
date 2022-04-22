package moram.adminboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import moram.vo.AttachVO;
import moram.vo.BoardLikeVO;
import moram.vo.BoardVO;
import moram.vo.ReplyVO;
import moram.vo.VoteVO;

public interface IAdminBoardDao {

	public int adminTotalCount(BoardVO vo) throws SQLException;
	
	public List<BoardVO> adminSelectByPage(BoardVO vo) throws SQLException;
	
	public List<BoardVO> adminBoradList(BoardVO vo) throws SQLException;
	
	public BoardVO adminBoardInfo(BoardVO vo) throws SQLException;

	public int insertAdminBoard(BoardVO vo) throws SQLException;
	
}
