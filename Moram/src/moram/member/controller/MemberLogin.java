package moram.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import moram.member.service.IMemberService;
import moram.member.service.MemberServiceImpl;
import moram.vo.MemberVO;

/**
 * 로그인 처리하고 세션을 저장하는 서블릿
 */
@WebServlet("/MemberLogin.do")
public class MemberLogin extends HttpServlet {
   private static final long serialVersionUID = 1L;

    public MemberLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      request.setCharacterEncoding("utf-8");
      
      response.setContentType("text/html; charset=utf-8");
      PrintWriter out = response.getWriter();
      HttpSession session = request.getSession();
      MemberVO vo = new MemberVO();
      
      IMemberService service = MemberServiceImpl.getIntance();
      //2. service 메소드 호출 - 결과값
      String id = request.getParameter("UserId");      // jsp 폼에서  input해서 post 방식으로 보내온 정보를 get파라미터로 가져온다.  
      String pwd = request.getParameter("PassWord");
      //입력받은 데이터를 MemberVO 객체에 담는ek.
//      System.out.println("id=" + id + "  " + "pass="  +  pwd);
      
      
      vo.setMem_id(id);
      vo.setMem_pass(pwd);
      
      //DB에서 id 와 pwd 를 이용하여 해당 회원정보를 가져온다. 
      MemberVO returnMemVo = service.getLoginMember(vo);
      
      String div=null;
      String jstate = null;
      try {
    	  session.setAttribute("sessionmem_jstate", returnMemVo.getMem_jstate());
    	  session.setAttribute("sessionDiv", returnMemVo.getMem_div());
    	  div =(String) session.getAttribute("sessionDiv");
    	  jstate=(String) session.getAttribute("sessionmem_jstate");
    	  String outMember = "탈퇴회원";
    	  
    	  if(jstate.equals(outMember)) {  // 로그인 실패 // 세션에 값 저장 안하고 들어감
    		  		System.out.println(" 탈퇴회원 거르기 성공 " + outMember);
    		  out.print("<script>"
    				  + "alert('탈퇴한 회원입니다.');"
    				  + "</script>");

    		  request.getRequestDispatcher("/login.jsp").forward(request, response);
    		  
    	  }else{ 
    		  
    		  if(div.equals("관리자")) {
    			  System.out.println("관리자 로그인성공");// 로그인 성공 // 세션에 값 저장 하고 들어감
    			  session.setAttribute("sessionId", returnMemVo.getMem_id());
    			  session.setAttribute("sessionName", returnMemVo.getMem_name());
    			  
//         String ssId=(String) session.getAttribute("sessionId"); // 세션set 한걸세션get 하고 스트링으로 형변환
//         String ssName=(String) session.getAttribute("sessionName"); // 세션set 한걸세션get 하고 스트링으로 형변환
    			  response.sendRedirect(request.getContextPath() + "/adminMain.jsp");
    		  }else {
    			  System.out.println("회원 로그인성공");// 로그인 성공 // 세션에 값 저장 하고 들어감
    			  session.setAttribute("sessionId", returnMemVo.getMem_id());
    			  session.setAttribute("sessionName", returnMemVo.getMem_name());
    			  response.sendRedirect(request.getContextPath() + "/main.jsp?query=");
    		  }

    		  request.setAttribute("check", true);
    		  
    		
    	  }
    	  
	} catch (Exception e) {
		e.printStackTrace();
		  out.print("<script>"
				  + "alert('아이디나 비밀번호가 틀렸습니다.d');"
				  + "</script>");

		  request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
      
      
      
   }

}