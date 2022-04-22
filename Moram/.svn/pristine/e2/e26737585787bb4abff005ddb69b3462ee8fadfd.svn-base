package moram.mypage.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import moram.ibatis.config.SqlMapClientFactory;
import moram.vo.ClassVO;
import moram.vo.MemberVO;
import moram.vo.MoramMemberVO;
import moram.vo.MoramVO;
import moram.vo.PlaceVO;
import moram.vo.SubscribeVO;
import moram.vo.TeacherVO;


public class MypageDaoImpl implements IMypageDao{

	private static IMypageDao dao;
	private SqlMapClient smc;
	
	private MypageDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMypageDao getInstance() {
		if(dao == null) {
			dao = new MypageDaoImpl();
		}
		return dao;
	}

	@Override
	public MemberVO memberInfo(String memId) throws SQLException {
		return (MemberVO) smc.queryForObject("myPage.memberInfo", memId);
	}

	@Override
	public int memberInfoUpdate(MemberVO vo) throws SQLException {
		return smc.update("myPage.memberInfoUpdate", vo);
	}

	@Override
	public int youJigi(String memId) throws SQLException {
		return (int) smc.queryForObject("myPage.youJIgi", memId);
	}

	@Override
	public String moramSubscribePay(SubscribeVO vo) throws SQLException {
		return (String) smc.insert("myPage.moramSubscribePay", vo);
	}

	@Override
	public int passwordChk(Map<String, String> vo) throws SQLException {
		return (int) smc.queryForObject("myPage.passwordChk", vo);
	}

	@Override
	public List<PlaceVO> placeTimeRezList(String memId) throws SQLException {
		return (List<PlaceVO>) smc.queryForList("myPage.placeTimeRezList", memId);
	}

	@Override
	public String placeTimeRezrePay(String PLNO) throws SQLException {
		return (String) smc.insert("myPage.placeTimeRezRePay", PLNO);
	}

	@Override
	public List<ClassVO> preferClassList(String memId) throws SQLException {
		return (List<ClassVO>) smc.queryForList("myPage.preferClassList", memId);
	}

	@Override
	public List<MoramVO> preferMoramList(String memId) throws SQLException {
		return (List<MoramVO>) smc.queryForList("myPage.preferMoramList", memId);
	}

	@Override
	public Object teacherApply(TeacherVO vo) throws SQLException {
		return (String) smc.insert("myPage.teacherApply", vo);
	}

	@Override
	public int memberDelete(String memId) throws SQLException {
		return smc.update("myPage.memberDelete", memId);
	}

	@Override
	public int moramWeim(Map<String, String> morami) throws SQLException {
		return smc.update("myPage.moramWeim", morami);
	}

	@Override
	public int placepayrefund(String payNo) throws SQLException {
		return smc.update("myPage.placepayrefund", payNo);
	}

	@Override
	public List<MoramVO> mainMoram(String search) throws SQLException {
		return smc.queryForList("myPage.mainMoram", search);
	}

	@Override
	public List<ClassVO> mainClass(String search) throws SQLException {
		return smc.queryForList("myPage.mainClass", search);
	}

	@Override
	public int passUpdate(Map<String, String> memPass) throws SQLException {
		return smc.update("myPage.passUpdate", memPass);
	}

	@Override
	public int moramFive(String memId) throws SQLException {
		return smc.update("myPage.moramFive", memId);
	}

	@Override
	public int moramHun(String memId) throws SQLException {
		return smc.update("myPage.moramHun", memId);
	}

	@Override
	public MoramVO moramItzy(String moramName) throws SQLException {
		return (MoramVO) smc.queryForObject("myPage.moramItzy", moramName);
	}

	@Override
	public List<MoramMemberVO> moramiItzy(String memId) throws SQLException {
		return smc.queryForList("myPage.moramiItzy", memId);
	}

	@Override
	public List<SubscribeVO> moramPayList(String memId) throws SQLException {
		return smc.queryForList("myPage.moramPayList", memId);
	}

	@Override
	public int moramRefund(String subNo) throws SQLException {
		return smc.update("myPage.moramRefund", subNo);
	}

	@Override
	public int moramReset(String memId) throws SQLException {
		return smc.update("myPage.moramReset", memId);
	}

	@Override
	public int moramPayChk(Map<String, String> idSubNo) throws SQLException {
		return (int) smc.queryForObject("myPage.moramPayChk", idSubNo);
	}

	@Override
	public int placePayRefund(String payNo) throws SQLException {
		return smc.update("myPage.placePayRefund", payNo);
	}
	
	
	
	
}
