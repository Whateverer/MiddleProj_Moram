package moram.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import moram.member.service.IMemberService;
import moram.member.service.MemberServiceImpl;
import moram.vo.MemberVO;
import moram.vo.MemfavcatVO;

/**
 * 입력한 정보를 추가하는 클래스
 */
@WebServlet("/MemberInsert.do")
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		MemberVO vo = new MemberVO();
		//MemfavcatVO fo = new MemfavcatVO();
		//0. 클라이언트 요청시 전송값
		
		vo.setMem_id(request.getParameter("id"));
		vo.setMem_pass(request.getParameter("pass"));
		vo.setMem_image(request.getParameter("image"));
		vo.setMem_name(request.getParameter("name"));
		vo.setMem_bir(request.getParameter("bir"));
		vo.setMem_email(request.getParameter("email"));
		vo.setMem_tel(request.getParameter("tel"));
		vo.setMem_rgn(request.getParameter("rgn"));		
		//////////////////////////////////////////////////////
//		fo.setMem_id(request.getParameter("id"));
		//fo.setSubject_no(Integer.parseInt(request.getParameter("subject_no")));
		
		String chk[] = request.getParameterValues("subject_no");
		System.out.println(chk);
		IMemberService service = MemberServiceImpl.getIntance();
		int insertmem = service.insertMember(vo);
		
		for(int i=0; i<chk.length; i++) {
			  MemfavcatVO fo = new MemfavcatVO();
			  fo.setMem_id(request.getParameter("id"));
			  fo.setSubject_no(Integer.parseInt(chk[i])); 
			  int insertmfc = service.insertMemfavcat(fo);
			  request.setAttribute("res2", insertmfc);
			  System.out.println("insertmfc=" + request.getAttribute("res2"));
		}
		
		
		//0-1 ip 설정 
			
		//1. service 객체 얻기
		//2. service 메소드 호출 - 결과값
		//3. request. 에 저장.
			request.setAttribute("res", insertmem);
			System.out.println("insertmem=" + request.getAttribute("res"));
		//4. jsp 로 
			request.getRequestDispatcher("join/congraturation.jsp").forward(request, response);
		
		
		
		
	}

}
