package kr.co.jboard2.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.dao.ArticleDao;
import kr.co.jboard2.vo.ArticleVo;

public class ListService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String pg = req.getParameter("pg");

		int total = ArticleDao.getInstance().selectCountArticle();
		int lastPageNum = getLastPageNum(total);
		int currentPage = getCurrentPage(pg);
		int start = getLimitStart(currentPage);
		int pageStartNum = getPageStartNum(total, start);
		int groups[] = getPageGroup(currentPage, lastPageNum);
		
		List<ArticleVo> articles = ArticleDao.getInstance().selectArticles(start);
		
		req.setAttribute("articles", articles);
		req.setAttribute("groups", groups);
		req.setAttribute("pageStartNum", pageStartNum);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		
		return "/list.jsp";
	}// requestProc end..
	
	public int[] getPageGroup(int currentPage, int lastPageNum) {
		
		int groupCurrent = (int) Math.ceil(currentPage / 5.0);
		int groupStart = (groupCurrent - 1) * 5 + 1;
		int groupEnd = groupCurrent * 5;
		
		if(groupEnd > lastPageNum) {
			groupEnd = lastPageNum;
		}
		
		int[] groups = {groupStart, groupEnd};
		
		return groups;
		
	}
	
	public int getPageStartNum(int total, int start) {
		return total - start;
	}
	
	public int getLimitStart(int currentPage) {
		return (currentPage - 1) * 10;
	}
	
	public int getCurrentPage(String pg) {
		
		int currentPage = 1;
		
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		
		return currentPage;
	}
	
	public int getLastPageNum(int total) {
		
		int lastPageNum = 0;
		
		if(total % 10 == 0){
			lastPageNum = total / 10;
		}else{
			lastPageNum = total / 10 + 1;
		}
		
		return lastPageNum;
	}
}
