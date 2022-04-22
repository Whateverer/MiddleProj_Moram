package moram.member.Dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import moram.ibatis.config.SqlMapClientFactory;
import moram.vo.MemberVO;
import moram.vo.MemfavcatVO;

public class MemberDaoImpl implements IMemberDao{


	   // 1번
	   private static MemberDaoImpl dao;
	   private static SqlMapClient smc;
	   // 2번
	   private MemberDaoImpl() {
	      smc = SqlMapClientFactory.getSqlMapClient();
	   }
	   
	   // 3번
	   public static MemberDaoImpl getInstance() {
	      if(dao == null) dao = new MemberDaoImpl();
	      return dao;
	   }
	
	@Override
	public int insertMember(MemberVO vo) throws SQLException {
		int val =0;
		if(smc.insert("member.insertMember",vo)==null) {
			val = 1;
		}
		return val;
	}

	@Override
	public int deleteMember(String mem_id) throws SQLException {
		
		return smc.delete("member.deleteMember",mem_id);
	}

	@Override
	public int updateMember(MemberVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.update("member.updateMember",vo);
	}

	@Override
	public List<MemberVO> getAllMember() throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("member.updateMember");
	}

	@Override
	public String getMemberCount(String mem_id) throws SQLException {
		// TODO Auto-generated method stub
		return  (String) smc.queryForObject("member.getMemberCount",mem_id);
	}

	@Override
	public int updateMember2(Map<String, String> paraMap) throws SQLException {
		// TODO Auto-generated method stub
		return (int) smc.queryForObject("member.updateMember2",paraMap);
	}

	@Override
	public MemberVO getLoginMember(MemberVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return  (MemberVO) smc.queryForObject("member.getLoginMember",vo);
	}

	@Override
	public String getMemberEmail(String mem_email) throws SQLException {
		// TODO Auto-generated method stub
		return (String) smc.queryForObject("member.getMemberEmail",mem_email);
	}

	@Override
	public int insertMemfavcat(MemfavcatVO vo) throws SQLException {
		// TODO Auto-generated method stub
		int cnt = 0;
		if(smc.insert("member.insertMemfavcat",vo)==null) {
			cnt = 1;
		}
		return cnt;
		//return (int)smc.insert("member.insertMemfavcat",vo);
	}

	@Override
	public int updateNewPwd(MemberVO vo) throws SQLException {
		
		 int aa  = smc.update("member.updateNewPwd",vo);
		 System.out.println("dao aa ============================" + aa);
		 return aa;
	}

	@Override
	public String getFgId(MemberVO vo) throws SQLException {
		
		return (String) smc.queryForObject("member.getFgId",vo);
	}



	

}
