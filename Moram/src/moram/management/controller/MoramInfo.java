package moram.management.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.management.service.IManagementService;
import moram.management.service.ManagementServiceImpl;
import moram.vo.MoramVO;

/**
 * 모람을 조회하고 리스트로출력하는 클래스
 */
@WebServlet("/MoramInfo.do")
public class MoramInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MoramInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	    IManagementService service = ManagementServiceImpl.getInstance();
	    
	    List<MoramVO> moramlist = service.moramInfo();
	    
	    request.setAttribute("moramList", moramlist);
	    request.getRequestDispatcher("/management/moramList.jsp").forward(request, response);
	    
	}

}
