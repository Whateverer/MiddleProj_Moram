package api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
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


@WebServlet("/Approval.do")
public class Approval extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("test");
		HttpSession session = request.getSession();
		
		String ptNo = request.getParameter("partner_order_id");
		payTestDao dao = new payTestDao();
		
		PlaceVO vo = dao.paytest2(ptNo);	
		
		String tid = vo.getPlacepay_no();
		String partner_order_id = ptNo;
		String partner_user_id = vo.getMem_id();
		String pg_token = request.getParameter("pg_token");
		
		System.out.println(tid);
		System.out.println(partner_order_id);
		System.out.println(partner_user_id);
		System.out.println(pg_token);
		
		URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "KakaoAK 9c32c7ece2c0c443d49743428a59e993");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");
		conn.setDoInput(true);
		conn.setDoOutput(true);
		

		Map<String, String> map = new HashMap<String, String>();
		map.put("cid", "TC0ONETIME");
		map.put("tid", tid);
		map.put("partner_order_id", partner_order_id);
		map.put("partner_user_id", partner_user_id);
		map.put("pg_token", pg_token);
		
		StringBuffer param = new StringBuffer();
		for(Map.Entry<String, String> one : map.entrySet()) {
			param.append(one.getKey() + "=" + one.getValue() + "&");
		}
		
		conn.getOutputStream().write(param.toString().getBytes());
		
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		try {
			JSONParser parse = new JSONParser();
			JSONObject obj = (JSONObject)parse.parse(in);
			
			String amount = obj.get("amount").toString();
			System.out.println(amount);
			JSONObject amountObj = (JSONObject)parse.parse(amount);
			String total = amountObj.get("total").toString();
			System.out.println(total);

			
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			in.close();
		}
		

		System.out.println("success 이동");

//		PrintWriter out = response.getWriter();
//		out.println("<script>");
//		out.println("parent.location.href='/PreparedKitchen/member.do?command=paymentinfo';");
//		out.println("</script>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
