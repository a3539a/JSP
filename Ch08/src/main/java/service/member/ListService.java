package service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommonService;
import vo.MemberVO;

public class ListService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		List<MemberVO> members = MemberDao.getInstance().selectMembers();
		
		// View에서 참조하기 위해 request 객체로 저장
		req.setAttribute("members", members);
		
		
		return "/member/list.jsp";
	}

	
}
