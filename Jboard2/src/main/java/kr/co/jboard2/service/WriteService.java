package kr.co.jboard2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jboard2.dao.ArticleDao;
import kr.co.jboard2.vo.ArticleVo;

public class WriteService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			//GET
			return "/write.jsp";
		}else {
			//POST
			MultipartRequest mRequest = getMultipartRequest(req);

			String uid     = mRequest.getParameter("uid");
			String title   = mRequest.getParameter("title");
			String content = mRequest.getParameter("content");
			String fname   = mRequest.getFilesystemName("fname");
			String regip   = req.getRemoteAddr();
			
			
			ArticleVo vo = new ArticleVo();
			vo.setTitle(title);
			vo.setContent(content);
			vo.setFile(fname == null ? 0 : 1);
			vo.setUid(uid);
			vo.setRegip(regip);
			
			ArticleDao.getInstance().insertArticle(vo);
			
			return "redirect:/Jboard2/list.do";
		}
	}// requestProc end...
	
	public MultipartRequest getMultipartRequest(HttpServletRequest req) {
		
		MultipartRequest mRequest = null;
		
		try {
			// Multipart 전송 데이터 수신
			String path = req.getServletContext().getRealPath("/file");
			int maxSize = 1024 * 1024 * 10; // 최대 파일 허용 용량 10MB
			mRequest = new MultipartRequest(req,
											path,
											maxSize,
											"UTF-8",
											new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mRequest;
	}//getMultipartRequest end...

}
