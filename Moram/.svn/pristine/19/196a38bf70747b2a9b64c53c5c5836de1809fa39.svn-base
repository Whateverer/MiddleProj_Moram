package moram.mypage.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import moram.vo.ClassVO;
import moram.vo.MemberVO;
import moram.vo.MoramMemberVO;
import moram.vo.MoramVO;
import moram.vo.PlaceVO;
import moram.vo.SubscribeVO;
import moram.vo.TeacherVO;

public interface IMypageService {

	
	public MemberVO memberInfo(String memId);
	
	public int memberInfoUpdate(MemberVO vo);
	
	public int youJigi(String memId);   // 밑에꺼랑 같이 사용하려고 만든 메서드
	
	public String moramSubscribePay(SubscribeVO vo);
	
	public int passwordChk(Map<String, String> vo);
	
	public List<PlaceVO> placeTimeRezList(String memId);
	
	public String placeTimeRezrePay(String PLNO);
	
	public List<ClassVO> preferClassList(String memId);
	
	public List<MoramVO> preferMoramList(String memId);
	
	public Object teacherApply(TeacherVO vo);
	
	public int memberDelete(String memId);
	
	public int moramWeim(Map<String, String> morami);

	public int placepayrefund(String payNo);
	
	public List<MoramVO> mainMoram(String search);
	
	public List<ClassVO> mainClass(String search);
	
	public int passUpdate(Map<String, String> memPass);
	
	public int moramFive(String memId);
	
	public int moramHun(String memId);
	
	public MoramVO moramItzy(String moramName);
	
	public List<MoramMemberVO> moramiItzy(String mrName);
	
	public List<SubscribeVO> moramPayList(String memId);
	
	public int moramRefund(String subNo);
	
	public int moramReset(String memId);
	
	public int moramPayChk(Map<String, String> idSubNo);
	
	public int placePayRefund(String payNo);
}
