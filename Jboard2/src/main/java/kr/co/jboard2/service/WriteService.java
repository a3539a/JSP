package kr.co.jboard2.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jboard2.dao.ArticleDao;
import kr.co.jboard2.vo.ArticleVo;

public class WriteService implements CommonService{
	
	private String path = null;

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
			
			int seq = ArticleDao.getInstance().insertArticle(vo);
			setFile(seq, fname, uid);
			
			return "redirect:/Jboard2/list.do";
		}
	}// requestProc end...
	
	public MultipartRequest getMultipartRequest(HttpServletRequest req) {
		
		MultipartRequest mRequest = null;
		
		try {
			// Multipart 전송 데이터 수신
			path = req.getServletContext().getRealPath("/file");
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

	public void setFile(int seq, String fname,String uid) {
		// 파일을 첨부 했으면
		if(fname != null){
			// 고유한 파일 이름 생성하기
			int i = fname.lastIndexOf(".");
			String ext = fname.substring(i);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss_");
			String now = sdf.format(new Date());
			String newName = now+uid+ext;
			
			// 파일명 수정 스트림 작업
			File oriFile = new File(path+"/"+fname);
			File newFile = new File(path+"/"+newName);
			oriFile.renameTo(newFile);
			
			// 파일 테이블 INSERT 작업
			ArticleDao.getInstance().insertFile(seq, fname, newName);
		}
	}
}// Write Service end..
