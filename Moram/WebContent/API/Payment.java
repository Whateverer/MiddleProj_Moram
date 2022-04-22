
package api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import moram.moramboard.dao.payTestDao;
import moram.vo.PlaceVO;




@WebServlet("/payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String ptNo =request.getParameter("ptNo");
		
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST"); // POST 방식으로 요청
			conn.setRequestProperty("Authorization", "KakaoAK 9c32c7ece2c0c443d49743428a59e993"); 
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8"); 
			conn.setDoInput(true); 
			conn.setDoOutput(true); 
	       

	       
			Map<String, String> params = new HashMap<String, String>();
			
	        params.put("cid", "TC0ONETIME");
	        params.put("partner_order_id", ptNo); // 결제번호
	        params.put("partner_user_id", "son1"); // 아이디
	        params.put("item_name", "초코파이"); // 상품이름
	        params.put("item_code", "1"); 
	        params.put("quantity", "1"); // 수량
	        params.put("total_amount", "5000"); // 가격
	        params.put("tax_free_amount", "0");
	        params.put("approval_url", "http://localhost:8080/"+request.getContextPath()+"/Approval.do?partner_order_id="+ptNo);
	        params.put("cancel_url", "http://localhost:8080/PreparedKitchen/payment/cancel.jsp");
	        params.put("fail_url", "http://localhost:8080/PreparedKitchen/payment/fail.jsp");
	        
	        String string_params = new String();
			for(Map.Entry<String, String> elem : params.entrySet()) {
				string_params += (elem.getKey() + "=" + elem.getValue() + "&");
			}
	        
	        
	        OutputStream out = conn.getOutputStream();
	        out.write(string_params.getBytes());
	        out.flush();
	        out.close(); // POST 호출
	 
	        
	        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String successUrl = null; // 준비 성공 시 연결할 url
			
	        try { // 응답받은 json 파싱작업
				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject)parser.parse(in);
				
				successUrl = (String)obj.get("next_redirect_pc_url");
				
				String tid = (String)obj.get("tid");

				String id = "son1";
				
				System.out.println(ptNo);
				System.out.println(id);
				
				PlaceVO vo = new PlaceVO();
				
				// tid 결제번호에 저장해야함
				vo.setPlacepay_no(tid);
				
				vo.setPlacetime_no(ptNo);
				vo.setMem_id(id);
				vo.setPlacepay_price(5000);
				
				
				payTestDao dao = new payTestDao();
				
				// 인서트하는 쿼리
				dao.paytest(vo);
				
			} catch (ParseException e) {
				e.printStackTrace();
			} finally {
				in.close(); // 응답 스트림 닫기
			}
			
	        System.out.println(successUrl);
	        
			response.sendRedirect(successUrl);
			
	
		}

	}


