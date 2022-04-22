package moram.adminboard.service;

import java.util.List;

import moram.vo.BoardVO;

public interface IAdminBoardService {
	
	public int adminTotalCount(BoardVO vo) ;    // 관리자 게시판  토탈 카운트 
	
	public List<BoardVO> adminSelectByPage(BoardVO vo) ;  // 관리자 게시판 페이지 수 가져오기
	
	public List<BoardVO> adminBoradList(BoardVO vo) ;	 // 관리자 게시판 관리자 게시판 리스트
	
	public BoardVO adminBoardInfo(BoardVO vo) ;		 // 관리자 게시판 관리자 게시판정보

	public int insertAdminBoard(BoardVO vo) ;	 // 관리자 게시판 게시글 작성

}
