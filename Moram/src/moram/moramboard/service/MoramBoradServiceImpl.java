package moram.moramboard.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import moram.moramboard.dao.IMoramBoardDao;
import moram.moramboard.dao.MoramBoradDaoImpl;
import moram.vo.AttachVO;
import moram.vo.BoardLikeVO;
import moram.vo.BoardVO;
import moram.vo.ReplyVO;
import moram.vo.VoteVO;

public class MoramBoradServiceImpl implements IMoramBoardService{
	
	private IMoramBoardDao dao;
	private static IMoramBoardService service;
	
	private MoramBoradServiceImpl() {
		dao = MoramBoradDaoImpl.getInstance();
	}
	
	public static IMoramBoardService getInstance() {
		if(service==null) service = new MoramBoradServiceImpl();
		return service;
	}

	@Override
	public int insertBoardLike(BoardLikeVO vo) {
		int cnt = 0;
		try {
			cnt = dao.insertBoardLike(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteBoardLike(BoardLikeVO vo) {
		int cnt = 0;
		try {
			cnt = dao.deleteBoardLike(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public List<BoardVO> selectByPage(BoardVO vo) {
		
		List<BoardVO> list = null;
		
		try {
			list = dao.selectByPage(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int totalCount(BoardVO vo) {
		int cnt = 0;
		try {
			cnt = dao.totalCount(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public BoardVO pageInfo(BoardVO bvo) {
		// 전체 글 갯수 가져오기
		int count = bvo.getTotalCount();
		int page = bvo.getStartPage();

		
		// 한페이지당 출력 글 갯수
		int perList = 3;
		
		// 한화면에 출력할 페이지 수
		int perPage = 2;
		
		// 전체페이지 수 - 전체글 갯수 / perList
		int totalPage = (int) Math.ceil((double)count / perList);
		
		// list의 시작 번호와 끝 번호 1~3, 4~6, 7~9
		int start = (page-1) * perList + 1;
		
		int end = start + perList -1;
		if(end > count) {
			end = count;
		}
		// 시작페이지와 끝페이지 1~2, 3~4, 5~6
		int startPage = ((page-1)/ perPage * perPage)+1;
		int endPage = startPage + perPage -1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		BoardVO vo = new BoardVO();
		
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}

	@Override
	public List<BoardVO> moramBoradList(BoardVO vo) {
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			list =  dao.moramBoradList(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public BoardVO moramBoardInfo(BoardVO vo) {
		
		BoardVO info = new BoardVO();
		
		try {
			info = dao.moramBoardInfo(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return info;
	}

	@Override
	public List<ReplyVO> replyList(int boardNo) {
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		
		try {
			list =  dao.replyList(boardNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 모람 공지사항, 자유게시판, 정모후기
	@Override
	public int insertMrBoard(BoardVO vo) {
		int board_no = 0;
		
		try {
			board_no = dao.insertMrBoard(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return board_no;
	}

	@Override
	public int updateMrBoard(BoardVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.updateMrBoard(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int deleteMrBoard(int boardNo) {
		int cnt = 0;
		
		try {
			cnt = dao.deleteMrBoard(boardNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

//	@Override
//	public List<BoardVO> hOutBoardListAll() {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public BoardVO hOutBoardInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertHOutBoard(BoardVO vo) {
		int cnt =0;
		try {
			cnt = dao.insertHOutBoard(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateHOutBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public VoteVO voteBoardInfo(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertVote(VoteVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateVote(VoteVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteVote(VoteVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertAttach(AttachVO vo) {
		try {
			dao.insertAttach(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public int accessCheck(BoardVO vo) {
		int cnt = 0;
		try {
			cnt = dao.accessCheck(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateReply(ReplyVO vo) {
		int cnt = 0;
		try {
			cnt = dao.updateReply(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteReply(int replyNo) {
		int cnt = 0;
		try {
			cnt = dao.deleteReply(replyNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int insertReply(ReplyVO vo) {
		int cnt = 0;
		try {
			cnt = dao.insertReply(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteBoardReply(int boardNo) {
		int cnt = 0;
		try {
			cnt = dao.deleteBoardReply(boardNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public int deleteBoardAttach(int boardNo) {
		int cnt = 0;
		try {
			cnt = dao.deleteBoardAttach(boardNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int chkBoardLike(BoardLikeVO vo) {
		int cnt = 0;
		try {
			cnt = dao.chkBoardLike(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateBoardHit(int boardNo) {
		int cnt = 0;
		try {
			cnt = dao.updateBoardHit(boardNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
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

	@Override
	public List<AttachVO> boardImg(int boardNo) {
		List<AttachVO> list = null;
		try {
			return list = dao.boardImg(boardNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

}
