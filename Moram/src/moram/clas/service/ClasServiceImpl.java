package moram.clas.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import moram.clas.dao.ClasDaoImpl;
import moram.clas.dao.IClasDao;
import moram.vo.ClassReplyVO;
import moram.vo.ClassVO;
import moram.vo.LectureVO;
import moram.vo.MemberVO;
import moram.vo.ZipVO;

public class ClasServiceImpl implements IClasService{

	
	private static IClasService service;
	private IClasDao dao;
	
	private ClasServiceImpl() {
		dao = ClasDaoImpl.getInstance();
	}
	
	public static IClasService getInstance() {
		if(service == null) {
			service = new ClasServiceImpl();
		}
		return service;
	}
	
	
	@Override
	public int youMoramSem(String memId) {
		int result = 0;
		
		try {
			result = dao.youMoramSem(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public int classAcs(ClassVO vo) {
		int result = 0;

		try {
			result = dao.classAcs(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public String classRegist(ClassVO vo) {
		String result = "";
		
		try {
			result = dao.classRegist(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int classInfoUpdate(ClassVO vo) {
		int result = 0;
		
		try {
			result = dao.classInfoUpdate(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int classDelete(ClassVO vo) {
		int result = 0;
		
		try {
			result = dao.classDelete(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Object classPrefer(ClassVO vo) {
		String result = "";
		
		try {
			result = (String) dao.classPrefer(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int classNotPrefer(ClassVO vo) {
		int result = 0;
		
		try {
			result = dao.classNotPrefer(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<ClassVO> allClassList() {
		List<ClassVO> result = new ArrayList<>();
		
		try {
			result = dao.allClassList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<ClassVO> semClassList(String memId) {
		List<ClassVO> result = new ArrayList<>();
		
		try {
			result = dao.semClassList(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<ClassVO> categoryClassList(String subName) {
		List<ClassVO> result = new ArrayList<>();
		
		try {
			result = dao.categoryClassList(subName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String lectureRegist(LectureVO vo) {
		String result = "";
		
		try {
			result = dao.lectureRegist(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int lectureUpdate(LectureVO vo) {
		int result = 0;
		
		try {
			result = dao.lectureUpdate(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int lectureDelete(String lectNo) {
		int result = 0;
		
		try {
			result = dao.lectureDelete(lectNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public String lectureRez(LectureVO vo) {
		String result = "";
		
		try {
			result = dao.lectureRez(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int lectureNotRez(LectureVO vo) {
		int result = 0;
		
		try {
			result = dao.lectureNotRez(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<LectureVO> lectureOfClass(String clasNo) {
		List<LectureVO> result = new ArrayList<>();
		
		try {
			result = dao.lectureOfClass(clasNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<LectureVO> completeLecture() {
		List<LectureVO> result = new ArrayList<>();
		
		try {
			result = dao.completeLecture();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<ClassVO> myClassList(String memId) {
		List<ClassVO> result = new ArrayList<>();
		
		try {
			result = dao.myClassList(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int classReplyRegist(ClassReplyVO vo) {
		int result = 0;
		
		try {
			result = dao.classReplyRegist(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int classReplyUpdate(ClassReplyVO vo) {
		int result = 0;
		
		try {
			result = dao.classReplyUpdate(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int classReplyDelete(String replNo) {
		int result = 0;
		
		try {
			result = dao.classReplyDelete(replNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public ClassVO classRead(String clasNo) {
		ClassVO result = new ClassVO();
		
		try {
			result = dao.classRead(clasNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<ZipVO> selectByDong(String dong) {
		List<ZipVO> list = null;
        try {
           list = dao.selectByDong(dong);
        } catch (SQLException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        }
        return list;
	}

	@Override
	public List<ClassVO> recClassList(String memId) {
		List<ClassVO> list = null;
        try {
           list = dao.recClassList(memId);
        } catch (SQLException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        }
        return list;
	}

	@Override
	public List<ClassVO> classReplyList(ClassReplyVO vo) {
		List<ClassVO> list = null;
        try {
           list = dao.classReplyList(vo);
        } catch (SQLException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        }
        return list;
	}

	@Override
	public int classImgUpdate(ClassVO vo) {
		int result = 0;

		try {
			result = dao.classImgUpdate(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int lectureRezChk(LectureVO vo) {
		int result = 0;

		try {
			result = dao.lectureRezChk(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int lectureAgainRezChk(LectureVO vo) {
		int result = 0;

		try {
			result = dao.lectureAgainRezChk(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int updateLectureRez(LectureVO vo) {
		int result = 0;

		try {
			result = dao.updateLectureRez(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int chkClassPrefer(ClassVO vo) {
		int result = 0;

		try {
			result = dao.chkClassPrefer(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<MemberVO> lectureRezList(String lectNo) {
		List<MemberVO> result = new ArrayList<>();
		
		try {
			result = dao.lectureRezList(lectNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<LectureVO> getClCalendar(String clNo) {
		List<LectureVO> result = new ArrayList<>();
		
		try {
			result = dao.getClCalendar(clNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}



}
