package moram.moramboard.service;

import java.sql.SQLException;
import java.util.List;

import moram.vo.AttachVO;
import moram.vo.BoardLikeVO;
import moram.vo.BoardVO;
import moram.vo.ReplyVO;
import moram.vo.VoteVO;

public interface IMoramBoardService {
	
	// 권한
	public int accessCheck(BoardVO vo);
	
	// 좋아요 했는지 체크하기
	public int chkBoardLike(BoardLikeVO vo);
	
	// 좋아요 누르기
	public int insertBoardLike(BoardLikeVO vo);
	
	// 좋아요 취소
	public int deleteBoardLike(BoardLikeVO vo); 
	
	// 전체 글 갯수 가져오기
	public int totalCount(BoardVO vo);

	// pageing 처리
	public BoardVO pageInfo(BoardVO vo);

	// 페이지 수 가져오기
	public List<BoardVO> selectByPage(BoardVO vo);
	
	// 해당모람 게시판글 전체를 가져오기
	public List<BoardVO> moramBoradList(BoardVO vo);
	
	// 선택한 게시판 글내용 가져오기
	public BoardVO moramBoardInfo(BoardVO vo);
	
	// 선택학 게시글 조회수 올리기
	public int updateBoardHit(int boardNo);
	
	// 해당글의 댓글들 가져오기
	public List<ReplyVO> replyList(int boardNo);
	
	// 댓글  작성하기
	public int insertReply(ReplyVO vo);
	
	// 댓글 수정하기
	public int updateReply(ReplyVO vo);
	
	// 댓글 삭제하기
	public int deleteReply(int replyNo);
	
	// 게시글 작성하기
	public int insertMrBoard(BoardVO vo);
	
	// 첨부파일 저장하기
	public void insertAttach(AttachVO vo);
	
	// 게시글 수정하기
	public int updateMrBoard(BoardVO vo);
	
	// 게시글 삭제하기
	public int deleteMrBoard(int boardNo);
	
	// 삭제하는 게시글에 댓글 삭제하기
	public int deleteBoardReply(int boardNo);
	
	// 삭제하는 게시글에 댓글 삭제하기
	public int deleteBoardAttach(int boardNo);
	
//	public List<BoardVO> hOutBoardListAll();
	
	// 정모내용을 가져오기
	public BoardVO hOutBoardInfo();
	
	// 정모내용 추가하기
	public int insertHOutBoard(BoardVO vo);
	
	// 정모내용 수정하기
	public int updateHOutBoard(BoardVO vo);
	
	// 투표내용 가져오기
	public VoteVO voteBoardInfo(int boardNo);
	
	// 투표내용 추가하기
	public int insertVote(VoteVO vo);
	
	// 투표내용 수정하기
	public int updateVote(VoteVO vo);
	
	// 투표내용 삭제하기
	public int deleteVote(VoteVO vo);

	// 게시판에 올린 이미지들 가져오기
	public List<AttachVO> boardImg(int boardNo);

	
	/////////////////////////////////////////////////////////////////////// 관리자 mr_no 차이로 추가 
	
	public int adminTotalCount(BoardVO vo) ;    // 관리자 게시판  토탈 카운트 
	
	public List<BoardVO> adminSelectByPage(BoardVO vo) ;  // 관리자 게시판 페이지 수 가져오기
	
	public List<BoardVO> adminBoradList(BoardVO vo) ;	 // 관리자 게시판 관리자 게시판 리스트
	
	public BoardVO adminBoardInfo(BoardVO vo) ;		 // 관리자 게시판 관리자 게시판정보

	public int insertAdminBoard(BoardVO vo) ;	 // 관리자 게시판 게시글 작성

}
