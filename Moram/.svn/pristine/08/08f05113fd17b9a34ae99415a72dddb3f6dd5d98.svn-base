package moram.moramboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import moram.vo.AttachVO;
import moram.vo.BoardLikeVO;
import moram.vo.BoardVO;
import moram.vo.ReplyVO;
import moram.vo.VoteVO;

public interface IMoramBoardDao {
	
	public int accessCheck(BoardVO vo) throws SQLException;
	
	public int chkBoardLike(BoardLikeVO vo) throws SQLException;
	
	public int insertBoardLike(BoardLikeVO vo) throws SQLException;
	
	public int deleteBoardLike(BoardLikeVO vo) throws SQLException; 
	
	public List<BoardVO> selectByPage(BoardVO vo) throws SQLException;
	
	public int totalCount(BoardVO vo) throws SQLException;
	
	public List<BoardVO> moramBoradList(BoardVO vo) throws SQLException;
	
	public BoardVO moramBoardInfo(BoardVO vo) throws SQLException;
	
	public int updateBoardHit(int boardNo) throws SQLException;
	
	public List<ReplyVO> replyList(int boardNo) throws SQLException;

	public int insertReply(ReplyVO vo) throws SQLException;
	
	public int updateReply(ReplyVO vo) throws SQLException;
	
	public int deleteReply(int replyNo) throws SQLException;
	
	public int insertMrBoard(BoardVO vo) throws SQLException;
	
	public void insertAttach(AttachVO vo) throws SQLException;
	
	public int updateMrBoard(BoardVO vo) throws SQLException;
	
	public int deleteMrBoard(int boardNo) throws SQLException;
	
	public int deleteBoardReply(int boardNo) throws SQLException;
	
	public int deleteBoardAttach(int boardNo) throws SQLException;
	
	public BoardVO hOutBoardInfo() throws SQLException;
	
	public int insertHOutBoard(BoardVO vo) throws SQLException;
	
	public int updateHOutBoard(BoardVO vo) throws SQLException;
	
	public VoteVO voteBoardInfo(int boardNo) throws SQLException;
	
	public int insertVote(VoteVO vo) throws SQLException;
	
	public int updateVote(VoteVO vo) throws SQLException;
	
	public int deleteVote(VoteVO vo) throws SQLException;

	public int adminTotalCount(BoardVO vo) throws SQLException;
	
	public List<BoardVO> adminSelectByPage(BoardVO vo) throws SQLException;
	
	public List<BoardVO> adminBoradList(BoardVO vo) throws SQLException;
	
	public BoardVO adminBoardInfo(BoardVO vo) throws SQLException;

	public int insertAdminBoard(BoardVO vo) throws SQLException;

	// 게시판에 올린 이미지들 가져오기
	public List<AttachVO> boardImg(int boardNo) throws SQLException;

	
}
