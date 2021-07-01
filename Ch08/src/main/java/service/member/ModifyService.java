package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommonService;
import vo.MemberVO;

public class ModifyService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		if(req.getMethod().equals("GET")) {

			//GET
			String uid = req.getParameter("uid");
			
			MemberVO vo = MemberDao.getInstance().selectMember(uid);
			
			req.setAttribute("memberVo", vo);
			
			return "/member/modify.jsp";
			
		}else {
			
			//POST
			String uid = req.getParameter("uid");
			String name = req.getParameter("name");
			String hp = req.getParameter("hp");
			String pos = req.getParameter("pos");
			String dep = req.getParameter("dep");
			
			MemberVO vo = new MemberVO();
			vo.setUid(uid);
			vo.setName(name);
			vo.setHp(hp);
			vo.setPos(pos);
			vo.setDep(dep);
			
			MemberDao.getInstance().updateMember(vo);
			
			return "redirect:/Ch08/member/list.do";
		}

	}

	
}
