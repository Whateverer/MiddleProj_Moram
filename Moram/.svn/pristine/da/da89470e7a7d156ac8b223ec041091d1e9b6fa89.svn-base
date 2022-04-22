package moram.adminboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.adminboard.service.AdminBoardServiceImpl;
import moram.adminboard.service.IAdminBoardService;
import moram.management.service.ManagementServiceImpl;
import moram.moramboard.service.IMoramBoardService;
import moram.moramboard.service.MoramBoradServiceImpl;
import moram.vo.BoardVO;

/**
 * Servlet 전체공지게시판 리스트
 */
@WebServlet("/adminBoardList.do")
public class AdminBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminBoardList() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 데이터가져오기
		String cpage = request.getParameter("cpage");
		int spage = Integer.parseInt(cpage);
		int boardgr_no = Integer.parseInt(request.getParameter("boardNo"));
		String mem_id = request.getParameter("mem_id");
		String mem_div = request.getParameter("mem_div");
		
		
		//List<BoardVO> list = service.moramBoradList(vo);
		BoardVO vo = new BoardVO();
		vo.setBoardgr_no(boardgr_no);
		vo.setStartPage(spage);
		
		IMoramBoardService mrService = MoramBoradServiceImpl.getInstance();
		
		IAdminBoardService amservice = AdminBoardServiceImpl.getInstance();
		
		vo.setMem_id(mem_id);
		vo.setMem_div(mem_div);
		
		int tcnt = amservice.adminTotalCount(vo);
		vo.setTotalCount(tcnt);
		
		BoardVO page = mrService.pageInfo(vo);
		int tPage=page.getTotalPage();
		int sPage=page.getStartPage();
		int ePage=page.getEndPage();
		
		vo.setStart(page.getStart());
		vo.setEnd(page.getEnd());

		List<BoardVO> list= amservice.adminSelectByPage(vo);
		
		request.setAttribute("list", list);
		request.setAttribute("tPage", tPage);
		request.setAttribute("sPage", sPage);
		request.setAttribute("ePage", ePage);

		
		// 4. 응답결과생성 - json - jsp로 위임 - forword
		request.getRequestDispatcher("adminboard/adminBoardList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
