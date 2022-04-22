package moram.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import moram.vo.MemberVO;
import moram.vo.MemfavcatVO;

public class MemberServiceImpl implements IMemberService{

	private moram.member.Dao.IMemberDao dao;  // DAO객체의 참조값이 저장될 변수 선언
	
	private static MemberServiceImpl memberService;
	
	
	private MemberServiceImpl() {
		
		dao = moram.member.Dao.MemberDaoImpl.getInstance();  // DAO객체 생성
	}

	public static MemberServiceImpl getIntance(){
		if(memberService==null) memberService = new MemberServiceImpl();
		return memberService;
	} 
	
	@Override
	public int insertMember(MemberVO vo) {
		int val=0;
		try {
			val=dao.insertMember(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}

	@Override
	public int deleteMember(String mem_id) {
		int val=0;
		try {
			val=dao.deleteMember(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}

	@Override
	public int updateMember(MemberVO vo) {
		int val=0;
		try {
			val=dao.updateMember(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}

	@Override
	public List<MemberVO> getAllMember() {
		 List<MemberVO> list = null;
		try {
			list = dao.getAllMember();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String getMemberCount(String mem_id) {
		String val=null;
		try {
			val=dao.getMemberCount(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}

	@Override
	public int updateMember2(Map<String, String> paraMap) {
		int val=0;
		try {
			val=dao.updateMember2(paraMap);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return val;
	}

	@Override
	public MemberVO getLoginMember(MemberVO vo) {
		MemberVO vp = null;
		try {
			vp=(MemberVO) dao.getLoginMember(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vp;
	}

	@Override
	public String getMemberEmail(String mem_email) {
		String val = null;
		try {
			val = dao.getMemberEmail(mem_email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}

	@Override
	public int insertMemfavcat(MemfavcatVO vo) {
int val = 0;
		
		try {
			val = dao.insertMemfavcat(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}

	@Override
	public int updateNewPwd(MemberVO vo) {
		int val = 0;
		
		try {
			val = dao.updateNewPwd(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}

	@Override
	public String getFgId(MemberVO vo) {
	String val = null;
		
		try {
			val = dao.getFgId(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}

}
