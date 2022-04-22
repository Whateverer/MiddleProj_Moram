package moram.moram.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import moram.ibatis.config.SqlMapClientFactory;
import moram.vo.AttachVO;
import moram.vo.BoardVO;
import moram.vo.DeleteMoramMemberVO;
import moram.vo.MoramMemberVO;
import moram.vo.MoramPreferVO;
import moram.vo.MoramVO;

public class MoramDaoImpl implements IMoramDao{
	private SqlMapClient smc;
	private static IMoramDao dao;
	private MoramDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMoramDao getInstance() {
		if(dao==null) dao = new MoramDaoImpl();
		return dao;
	}

	@Override
	public String insertMoram(MoramVO vo) throws SQLException {
		
		return (String)smc.insert("moram.insertMoram", vo);
	}

	//모람지기 구독권 구매여부 check
	@Override
	public int moramSubscribeChk(String memId) throws SQLException {
		
		return (int)smc.queryForObject("moram.moramSubscribeChk", memId);
	}

	//모람명 중복체크
	@Override
	public int moramNameChk(String mrname) throws SQLException {
		
		return (int)smc.queryForObject("moram.moramNameChk", mrname); 
	}

	@Override
	public List<MoramVO> myMoramList(String memId) throws SQLException {
		return smc.queryForList("moram.myMoramList", memId);
	}

	@Override
	public List<MoramVO> preferMoramList(String memId) throws SQLException {
		
		return smc.queryForList("moram.preferMoramList", memId);
	}

	@Override
	public List<MoramVO> selCatMoramList(int catNo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("moram.selCatMoramList", catNo);
	}

	@Override
	public List<MoramVO> sameCatMoramList(String memId) throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("moram.sameCatMoramList", memId);
	}

	@Override
	public MoramVO moraminfo(String mrNo) throws SQLException {
		// TODO Auto-generated method stub
		return (MoramVO)smc.queryForObject("moram.moraminfo", mrNo);
	}

	@Override
	public int moramMemChk(DeleteMoramMemberVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (int)smc.queryForObject("moram.moramMemChk", vo);
	}

	@Override
	public String insertMoramMember(MoramMemberVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (String) smc.insert("moram.insertMoramMember",vo);
	}
	
	
	// 관심모람에 추가
	@Override
	public void insertMoramPrefer(MoramPreferVO vo) throws SQLException {
		smc.insert("moram.insertMoramPrefer", vo);
	}

	@Override
	public int updateMoraminfo(MoramVO vo) throws SQLException {
		
		return smc.update("moram.updateMoraminfo", vo);
	}

	@Override
	public void moramInvite() throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BoardVO> getCalendar(String moramId) throws SQLException {
		return (List<BoardVO>)smc.queryForList("moram.getCalendar", moramId);
	}

	@Override
	public int deleteMoramMember(DeleteMoramMemberVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.delete("moram.deleteMoramMember", vo);
	}

	@Override
	public int moramMemCnt(String mrNo) throws SQLException {
		// TODO Auto-generated method stub
		return (int)smc.queryForObject("moram.moramMemCnt",mrNo);
	}

	@Override
	public List<MoramMemberVO> getAllMorami(String moramId) throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("moram.getAllMorami", moramId);
	}

	@Override
	public int MoramjigiChk(MoramMemberVO vo) throws SQLException {
		
		return (int) smc.queryForObject("moram.MoramjigiChk", vo);
	}

	@Override
	public int chkMoramPrefer(MoramMemberVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (int)smc.queryForObject("moram.chkMoramPrefer", vo);
	}

	@Override
	public Object moramPrefer(MoramMemberVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.insert("moram.moramPrefer", vo);
	}

	@Override
	public int moramNotPrefer(MoramMemberVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (int)smc.delete("moram.moramNotPrefer", vo);
	}
	
	// 사진첩
	@Override
	public List<AttachVO> imagesList(String mrNo) throws SQLException {
		return smc.queryForList("moram.imagesList", mrNo);
	}

	// 모람 개설시 모람지기를 모람멤버에 추가
	@Override
	public String insertMoramjigi(MoramMemberVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (String) smc.insert("moram.insertMoramjigi", vo);
	}

	// 선택한 일정을 출력
	@Override
	public List<BoardVO> scheduleDetail(BoardVO vo) throws SQLException {
		
		return (List<BoardVO>)smc.queryForList("moram.scheduleDetail", vo);
	}

	@Override
	public int moramImgUpdate(MoramVO vo) throws SQLException {
		
		return smc.update("moram.moramImgUpdate", vo);
	}

	

	


}
