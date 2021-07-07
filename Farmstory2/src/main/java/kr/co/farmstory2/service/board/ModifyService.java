package kr.co.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.dao.ArticleDao;
import kr.co.farmstory2.service.CommonService;
import kr.co.farmstory2.vo.ArticleVo;

public class ModifyService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			String seq = req.getParameter("seq");
		 	ArticleVo articleVo = ArticleDao.getInstance().selectArticle(seq);
		 	
		 	req.setAttribute("articleVo", articleVo);
			
			return "/modify.jsp";	
		}else {
			String seq     = req.getParameter("seq");
			String title   = req.getParameter("title");
			String content = req.getParameter("content");

			ArticleDao.getInstance().updateArticle(title, content, seq);
			
			return "redirect:/Jboard2/view.do?seq="+seq;
		}
		
	}

}