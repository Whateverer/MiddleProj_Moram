package moram.moramboard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;

import moram.moramboard.service.IMoramBoardService;
import moram.moramboard.service.MoramBoradServiceImpl;
import moram.vo.BoardVO;


@WebServlet("/MrBoardList.do")
public class MrBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 데이터가져오기
		String cpage = request.getParameter("cpage");
		int spage = Integer.parseInt(cpage);
		int boardgr_no = Integer.parseInt(request.getParameter("boardNo"));
		String mr_no = request.getParameter("mrNo");
		String mem_id = request.getParameter("mem_id");
		String mem_div = request.getParameter("mem_div");
		
		IMoramBoardService service = MoramBoradServiceImpl.getInstance();
		
		//List<BoardVO> list = service.moramBoradList(vo);
		BoardVO vo = new BoardVO();
		vo.setBoardgr_no(boardgr_no);
		vo.setMr_no(mr_no);
		vo.setStartPage(spage);
		
		vo.setMem_id(mem_id);
		vo.setMem_div(mem_div);
		int acsCheck = service.accessCheck(vo);
		
		int tcnt = service.totalCount(vo);
		vo.setTotalCount(tcnt);
		
		BoardVO page = service.pageInfo(vo);
		int tPage=page.getTotalPage();
		int sPage=page.getStartPage();
		int ePage=page.getEndPage();
		
		vo.setStart(page.getStart());
		vo.setEnd(page.getEnd());

		List<BoardVO> list= service.selectByPage(vo);
		
		request.setAttribute("list", list);
		request.setAttribute("tPage", tPage);
		request.setAttribute("sPage", sPage);
		request.setAttribute("ePage", ePage);
		request.setAttribute("acs", acsCheck);

		
		// 4. 응답결과생성 - json - jsp로 위임 - forword
		request.getRequestDispatcher("moram/mrBoardList.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
