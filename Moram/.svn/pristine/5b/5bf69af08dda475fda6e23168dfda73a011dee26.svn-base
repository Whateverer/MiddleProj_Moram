package moram.adminboard.dao;

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

public class AdminBoardDaoImpl implements IAdminBoardDao{
	
	private SqlMapClient smc;
	
	private static IAdminBoardDao dao;
	
	private AdminBoardDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IAdminBoardDao getInstance() {
		if(dao==null) dao = new AdminBoardDaoImpl();
		return dao;
	}


	@Override
	public int adminTotalCount(BoardVO vo) throws SQLException {
		// TODO 
		return (int) smc.queryForObject("adminboard.adminTotalCount",vo);
	}

	@Override
	public List<BoardVO> adminSelectByPage(BoardVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("adminboard.adminSelectByPage", vo);
	}

	@Override
	public List<BoardVO> adminBoradList(BoardVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("adminboard.adminBoradList", vo);
	}

	@Override
	public BoardVO adminBoardInfo(BoardVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (BoardVO) smc.queryForObject("adminboard.adminBoardInfo", vo);
	}

	@Override
	public int insertAdminBoard(BoardVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return  (int) smc.insert("adminboard.insertAdminBoard", vo);
	}






}
