package moram.adminboard.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import moram.adminboard.dao.AdminBoardDaoImpl;
import moram.adminboard.dao.IAdminBoardDao;
import moram.moramboard.dao.IMoramBoardDao;
import moram.moramboard.dao.MoramBoradDaoImpl;
import moram.vo.AttachVO;
import moram.vo.BoardLikeVO;
import moram.vo.BoardVO;
import moram.vo.ReplyVO;
import moram.vo.VoteVO;

public class AdminBoardServiceImpl implements IAdminBoardService{
	
	private IAdminBoardDao dao;
	private static IAdminBoardService service;
	
	private AdminBoardServiceImpl() {
		dao = AdminBoardDaoImpl.getInstance();
	}
	
	public static IAdminBoardService getInstance() {
		if(service==null) service = new AdminBoardServiceImpl();
		return service;
	}

	@Override
	public int adminTotalCount(BoardVO vo) {
		int val = 0;
		
		try {
			val = dao.adminTotalCount(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}

	@Override
	public List<BoardVO> adminSelectByPage(BoardVO vo) {
		List<BoardVO> list = null;
		
		try {
			list = dao.adminSelectByPage(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BoardVO> adminBoradList(BoardVO vo) {
		List<BoardVO> list = null;
		try {
			return list = dao.adminBoradList(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public BoardVO adminBoardInfo(BoardVO vo) {
		BoardVO vo2 = null;
		
		try {
			vo2 = dao.adminBoardInfo(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo2;
	}

	@Override
	public int insertAdminBoard(BoardVO vo) {
		int val =0;
		
		try {
			val = dao.insertAdminBoard(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}

}
