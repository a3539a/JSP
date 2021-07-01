package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommonService;

public class DeleteService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String uid = req.getParameter("uid");
		
		MemberDao.getInstance().deleteMember(uid);
		
		return "redirect:/Ch08/member/list.do";
	}

	
}
