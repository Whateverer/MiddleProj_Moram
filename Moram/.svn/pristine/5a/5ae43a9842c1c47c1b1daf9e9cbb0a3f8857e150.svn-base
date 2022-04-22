package moram.join.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 회원가입시 인증을 위한 메일을 발송하는 클래스
 */
@WebServlet("/mailSnd.do")
public class MailSnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MailSnd() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("시작");
		//발신자의 메일 계정과 비밀번호를 설정
		final String user = "ipooyttl@naver.com"; //발신자의 이메일 아이디를 입력 
		final String password = "01d8cf91"; //발신자 이메일의 패스워드를 입력
        int random = (int)(Math.random()*999999999+1);
        PrintWriter out = response.getWriter();
        String res = null;
        
        String useremail=request.getParameter("email");
 
        	int num =useremail.indexOf("@");
    		if(num==-1) {
    			out.print("<script>"
    					+ "alert('이메일주소에 @가 없습니다.');"
    					+ "'return false';"
    					+ "</script>");
    		}
    		String domain = useremail.substring(num);
    		int stmpcode=465;
    		String host ="smtp.naver.com";
    		
    		if(domain.contains("naver")) {
    			stmpcode=465;
    			 host ="smtp.naver.com";
    		}else if(domain.contains("gmail")) {
    			stmpcode=587;
    			host ="smtp.gamil.com";
    		}
    		//Property에 SMTP 서버 정보를 설정
    		Properties prop = new Properties(); 
    	
    		//mail.stmp.host : 이메일 발송을 처리해 줄 STMP서버를 나타냄(naver면 smtp.naver.com , 아래는 구글의 경우)
    		prop.put("mail.smtp.host", host); 
    		//mail.stmp.port : STMP서버와 통신하는 포트 (google : 587 / naver : 465)	
    		prop.put("mail.smtp.port", stmpcode); prop.put("mail.smtp.auth", "true"); 
    		prop.put("mail.smtp.ssl.enable", "true"); 
    		prop.put("mail.smtp.ssl.trust", host);
    		
    		//SMTP 서버 정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스를 생성한다.
    		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator(){
    						  protected PasswordAuthentication getPasswordAuthentication(){
    							  	    return new PasswordAuthentication(user, password);
    						  			}
    		});
    		
    		//Message 클래스의 객체를 사용하여 수신자와 내용, 제목의 메시지를 작성한다.
    		try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(user));

                //수신자메일주소
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(useremail)); 
                // Subject
                
                message.setSubject("오프라인 모임을 위한 \"모람\" 이메일 인증 메세지 입니다."); //메일 제목을 입력
                // Text
                message.setText(random+"    <--- 숫자를 인증창에 입력해주세요.");    //메일 내용을 입력
                //Transport 클래스를 사용하여 작성한 메세지를 전달한다.
                Transport.send(message); ////전송
                System.out.println("메세지가 성공적으로 전송되었습니다.");
            } catch (AddressException e) {
                e.printStackTrace();
            } catch (MessagingException e) {
                e.printStackTrace();
            }

    		
    		//request.setAttribute("random", random);
    		HttpSession sessionchk = request.getSession();
    		sessionchk.setAttribute("random", random);
    		
    		//request.getRequestDispatcher("Moram/emValChk").forward(request, response);
    		
    		request.getRequestDispatcher("join/emValChk.jsp").forward(request, response);
    		
     }
		
}


