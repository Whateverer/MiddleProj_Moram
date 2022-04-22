package moram.moramboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import moram.ibatis.config.SqlMapClientFactory;
import moram.moramboard.dao.IMoramBoardDao;
import moram.vo.AttachVO;
import moram.vo.BoardLikeVO;
import moram.vo.BoardVO;
import moram.vo.ReplyVO;
import moram.vo.VoteVO;

public class MoramBoradDaoImpl implements IMoramBoardDao{
	
	private SqlMapClient smc;
	
	private static IMoramBoardDao dao;
	
	private MoramBoradDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMoramBoardDao getInstance() {
		if(dao==null) dao = new MoramBoradDaoImpl();
		return dao;
	}

	@Override
	public int insertBoardLike(BoardLikeVO vo) throws SQLException {
		return (int) smc.insert("moramBoard.insertBoardLike", vo);

	}

	@Override
	public int deleteBoardLike(BoardLikeVO vo) throws SQLException {
		return smc.delete("moramBoard.deleteBoardLike", vo);
	}
	
	@Override
	public List<BoardVO> selectByPage(BoardVO vo) throws SQLException {
		
		return smc.queryForList("moramBoard.selectByPage", vo);
	}

	@Override
	public int totalCount(BoardVO vo) throws SQLException {
	
		return (int) smc.queryForObject("moramBoard.totalCount", vo);
	}

	@Override
	public List<BoardVO> moramBoradList(BoardVO vo) throws SQLException {
		return smc.queryForList("moramBoard.moramBoradList", vo);
	}

	@Override
	public BoardVO moramBoardInfo(BoardVO vo) throws SQLException {
		return (BoardVO) smc.queryForObject("moramBoard.moramBoardInfo", vo);
	}
	
	@Override
	public List<ReplyVO> replyList(int boardNo) throws SQLException {
		
		return smc.queryForList("moramBoard.replyList", boardNo);
	}
	
	@Override
	public int insertMrBoard(BoardVO vo) throws SQLException {
		return (int) smc.insert("moramBoard.insertMrBoard", vo);
	}

	@Override
	public int updateMrBoard(BoardVO vo) throws SQLException {
		return smc.update("moramBoard.updateMrBoard", vo);
	}

	@Override
	public int deleteMrBoard(int boardNo) throws SQLException {
		return smc.delete("moramBoard.deleteMrBoard", boardNo);
	}

	@Override
	public int deleteBoardReply(int boardNo) throws SQLException {
		return smc.delete("moramBoard.deleteBoardReply", boardNo);
	}
	
	@Override
	public int deleteBoardAttach(int boardNo) throws SQLException {
		return smc.delete("moramBoard.deleteBoardAttach", boardNo);
	}


//	@Override
//	public List<BoardVO> hOutBoardListAll() throws SQLException {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public BoardVO hOutBoardInfo() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertHOutBoard(BoardVO vo) throws SQLException {
		return (int) smc.insert("moramBoard.insertHOutBoard", vo);
	}

	@Override
	public int updateHOutBoard(BoardVO vo) throws SQLException {
		return smc.update("moramBoard.updateHOutBoard", vo);
	}


	@Override
	public VoteVO voteBoardInfo(int boardNo) throws SQLException {
		return (VoteVO) smc.queryForObject("moramBoard.voteBoardInfo", boardNo);
	}

	@Override
	public int insertVote(VoteVO vo) throws SQLException {
		return (int) smc.insert("moramBoard.insertVote", vo);
	}

	@Override
	public int updateVote(VoteVO vo) throws SQLException {
		return smc.update("moramBoard.updateVote", vo);
	}

	@Override
	public int deleteVote(VoteVO vo) throws SQLException {
		return smc.delete("moramBoard.deleteVote", vo);
	}

	@Override
	public void insertAttach(AttachVO vo) throws SQLException {
		smc.insert("moramBoard.insertAttach", vo);
		
	}

	@Override
	public int accessCheck(BoardVO vo) throws SQLException {
		return (int) smc.queryForObject("moramBoard.accessCheck", vo);
	}

	@Override
	public int updateReply(ReplyVO vo) throws SQLException {
		return smc.update("moramBoard.updateReply", vo);
	}

	@Override
	public int deleteReply(int replyNo) throws SQLException {
		return smc.delete("moramBoard.deleteReply", replyNo);
	}

	@Override
	public int insertReply(ReplyVO vo) throws SQLException {
		return (int) smc.insert("moramBoard.insertReply", vo);
	}

	@Override
	public int chkBoardLike(BoardLikeVO vo) throws SQLException {
		return (int) smc.queryForObject("moramBoard.chkBoardLike", vo);
	}

	@Override
	public int updateBoardHit(int boardNo) throws SQLException {
		return smc.update("moramBoard.updateBoardHit", boardNo);
	}

	@Override
	public int adminTotalCount(BoardVO vo) throws SQLException {
		// TODO 
		return (int) smc.queryForObject("moramBoard.adminTotalCount",vo);
	}

	@Override
	public List<BoardVO> adminSelectByPage(BoardVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("moramBoard.adminSelectByPage", vo);
	}

	@Override
	public List<BoardVO> adminBoradList(BoardVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("moramBoard.adminBoradList", vo);
	}

	@Override
	public BoardVO adminBoardInfo(BoardVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (BoardVO) smc.queryForObject("moramBoard.adminBoardInfo", vo);
	}

	@Override
	public int insertAdminBoard(BoardVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return  (int) smc.insert("moramBoard.insertAdminBoard", vo);
	}

	@Override
	public List<AttachVO> boardImg(int boardNo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("moramBoard.boardImg", boardNo);
	}






}
