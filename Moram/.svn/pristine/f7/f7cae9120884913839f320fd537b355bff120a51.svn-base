package moram.mypage.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import moram.mypage.dao.IMypageDao;
import moram.mypage.dao.MypageDaoImpl;
import moram.vo.ClassVO;
import moram.vo.MemberVO;
import moram.vo.MoramMemberVO;
import moram.vo.MoramVO;
import moram.vo.PlaceVO;
import moram.vo.SubscribeVO;
import moram.vo.TeacherVO;

public class MypageServiceImpl implements IMypageService{
	
	private static IMypageService service;
	private IMypageDao dao;
	
	private MypageServiceImpl() {
		dao = MypageDaoImpl.getInstance();
	}
	
	public static IMypageService getInstance() {
		if(service == null) {
			service = new MypageServiceImpl();
		}
		return service;
	}

	@Override
	public MemberVO memberInfo(String memId) {
		
		MemberVO vo = new MemberVO();
		
		try {
			vo = dao.memberInfo(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public int memberInfoUpdate(MemberVO vo) {
		
		int result = 0;
		
		try {
			result = dao.memberInfoUpdate(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int youJigi(String memId) {
		
		int result = 0;
		
		try {
			result = dao.youJigi(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public String moramSubscribePay(SubscribeVO vo) {
		
		String result = "";
		
		try {
			result = dao.moramSubscribePay(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int passwordChk(Map<String, String> vo) {
		int result = 0;
		
		try {
			result = dao.passwordChk(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<PlaceVO> placeTimeRezList(String memId) {
		
		List<PlaceVO> vo = new ArrayList<>();
		
		try {
			vo = dao.placeTimeRezList(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public String placeTimeRezrePay(String PLNO) {
		
		Object result = "";
		
		try {
			result = dao.placeTimeRezrePay(PLNO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return (String)result;
	}

	@Override
	public List<ClassVO> preferClassList(String memId) {
		
		List<ClassVO> vo = new ArrayList<>();
		
		try {
			vo = dao.preferClassList(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public List<MoramVO> preferMoramList(String memId) {
		
		List<MoramVO> vo = new ArrayList<>();
		
		try {
			vo = dao.preferMoramList(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public Object teacherApply(TeacherVO vo) {
		
		Object result = "";
		
		try {
			result = dao.teacherApply(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int memberDelete(String memId) {
		int result = 0;
		
		try {
			result = dao.memberDelete(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int moramWeim(Map<String, String> morami) {
		int result = 0;
		
		try {
			result = dao.moramWeim(morami);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int placepayrefund(String payNo) {
		int result = 0;
		
		try {
			result = dao.placepayrefund(payNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		
		return result;
	}

	@Override
	public List<MoramVO> mainMoram(String search) {
		List<MoramVO> result = new ArrayList<>();
		
		try {
			result = dao.mainMoram(search);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<ClassVO> mainClass(String search) {
		List<ClassVO> result = new ArrayList<>();
		
		try {
			result = dao.mainClass(search);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int passUpdate(Map<String, String> memPass) {
		int result = 0;
		
		try {
			result = dao.passUpdate(memPass);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int moramFive(String memId) {
		int result = 0;
		
		try {
			result = dao.moramFive(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int moramHun(String memId) {
		int result = 0;
		
		try {
			result = dao.moramHun(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public MoramVO moramItzy(String moramName) {
		MoramVO result = new MoramVO();
		
		try {
			result = dao.moramItzy(moramName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<MoramMemberVO> moramiItzy(String mrName) {
		List<MoramMemberVO> result = new ArrayList<>();
		
		try {
			result = dao.moramiItzy(mrName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<SubscribeVO> moramPayList(String memId) {
		List<SubscribeVO> result = new ArrayList<>();
		
		try {
			result = dao.moramPayList(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int moramRefund(String subNo) {
		int result = 0;
		
		try {
			result = dao.moramRefund(subNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int moramReset(String memId) {
		int result = 0;
		
		try {
			result = dao.moramReset(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int moramPayChk(Map<String, String> idSubNo) {
		int result = 0;
		
		try {
			result = dao.moramPayChk(idSubNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int placePayRefund(String payNo) {
		int result = 0;
		
		try {
			result = dao.placePayRefund(payNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
	
}
