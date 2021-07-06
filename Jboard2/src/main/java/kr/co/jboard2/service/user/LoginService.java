package kr.co.jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.dao.MemberDao;
import kr.co.jboard2.service.CommonService;
import kr.co.jboard2.vo.MemberVo;

public class LoginService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		if(req.getMethod().equals("GET")) {
			//GET
			return "/user/login.jsp";
		}else {
			//POST
			// ���۵����� ����
			String uid = req.getParameter("uid");
			String pass= req.getParameter("pass");
			
			MemberVo mv = MemberDao.getInstance().selectMember(uid, pass);
			
			if(mv != null) {
				// �α��� ����
				
				HttpSession sess = req.getSession();
				sess.setAttribute("sessMember", mv);
				
				return "redirect:/Jboard2/list.do";

			}else {
				// �α��� ����
				return "redirect:/Jboard2/user/login.do?success=100";
			}
			
			
		}
	}

}
