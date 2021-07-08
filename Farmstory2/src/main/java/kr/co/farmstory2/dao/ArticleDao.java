package kr.co.farmstory2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.farmstory2.db.DBConfig;
import kr.co.farmstory2.db.Sql;
import kr.co.farmstory2.vo.ArticleVo;
import kr.co.farmstory2.vo.FileVo;

// DAO(Data Access Object) 클래스
public class ArticleDao {

	private static ArticleDao instance = new ArticleDao();
	private ArticleDao() {}
	
	public static ArticleDao getInstance() {
		return instance;
	}
	

	
	public int selectMaxSeq() {
		int seq = 0;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_SEQ);
			
			if(rs.next()) {
				seq = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return seq;
	}
	
	public List<ArticleVo> selectLatests() {
		
		List<ArticleVo> latests = new ArrayList<>();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_LATESTS);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleVo article = new ArticleVo();
				article.setSeq(rs.getInt(1));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setRdate(rs.getString(11).substring(2, 10));
				
				latests.add(article);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return latests;
	}
	
	
	public int selectCountArticle(String cate) {
		
		int total = 0;
		
		try{
			// 1, 2 단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_ARTICLE);
			psmt.setString(1, cate);
			
			// 4단계
			ResultSet rs = psmt.executeQuery();
			
			// 5단계
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			// 6단계
			conn.close();
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return total;
	}
	
	public int insertArticle(ArticleVo vo) {
		try{
			// 1, 2 단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3 단계
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			psmt.setString(1, vo.getCate());
			psmt.setString(2, vo.getTitle());
			psmt.setString(3, vo.getContent());
			psmt.setInt(4, vo.getFile());
			psmt.setString(5, vo.getUid());
			psmt.setString(6, vo.getRegip());
			
			// 4 단계
			psmt.executeUpdate();
			
			
			
			// 5 단계
			// 6 단계
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return selectMaxSeq();
	}
	
	public void insertComment(ArticleVo comment) {
		
		try{
			// 1, 2 단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3 단계
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_COMMENT);
			psmt.setInt(1, comment.getParent());
			psmt.setString(2, comment.getContent());
			psmt.setString(3, comment.getUid());
			psmt.setString(4, comment.getRegip());
			
			// 4 단계
			psmt.executeUpdate();
			
			// 5 단계
			// 6 단계
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void insertFile(int seq, String fname, String newName) {
		try {
			// 1단계 , 2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, seq);
			psmt.setString(2, fname);
			psmt.setString(3, newName);
			
			// 4단계
			psmt.executeUpdate();
			
			// 5단계
			// 6단계
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArticleVo selectArticle(String seq) {
		
		ArticleVo article = new ArticleVo();
		FileVo fb = new FileVo();
		
		try{
			// 1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, seq);
			
			// 4단계
			ResultSet rs = psmt.executeQuery();
			
			// 5단계
			if(rs.next()) {
				article.setSeq(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
				
				// 추가 필드
				fb.setSeq(rs.getInt(12));
				fb.setParent(rs.getInt(13));
				fb.setOriName(rs.getString(14));
				fb.setNewName(rs.getString(15));
				fb.setDownload(rs.getInt(16));
				fb.setRdate(rs.getString(17));
				
				article.setFb(fb);
			}
			
			// 6단계
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return article;
	}
	
	public List<ArticleVo> selectArticles(String cate, int start) {
		
		// 게시물 가져오기
		List<ArticleVo> articles = new ArrayList<>();
			
		try{
			// 1단계, 2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setString(1, cate);
			psmt.setInt(2, start);
			
			// 4단계
			ResultSet rs = psmt.executeQuery();
			
			// 5단계
			while(rs.next()){
				ArticleVo article = new ArticleVo();
				article.setSeq(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
				article.setNick(rs.getString(12));
				
				articles.add(article);
			}
			
			// 6단계
			conn.close();
				
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return articles;
		
	}
	
	public List<ArticleVo> selectComments(String parent) {
		
		// 게시물 가져오기
		List<ArticleVo> articles = new ArrayList<>();
			
		try{
			// 1단계, 2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COMMENTS);
			psmt.setString(1, parent);
			
			// 4단계
			ResultSet rs = psmt.executeQuery();
			
			// 5단계
			while(rs.next()){
				ArticleVo article = new ArticleVo();
				article.setSeq(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
				article.setNick(rs.getString(12));
				
				articles.add(article);
			}
			
			// 6단계
			conn.close();
				
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return articles;
		
	}
	
	public FileVo selectFile(String seq) {
		
		FileVo fb = new FileVo();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_FILE);
			psmt.setString(1, seq);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				fb.setSeq(rs.getInt(1));
				fb.setParent(rs.getInt(2));
				fb.setOriName(rs.getString(3));
				fb.setNewName(rs.getString(4));
				fb.setDownload(rs.getInt(5));
				fb.setRdate(rs.getString(6));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return fb;
	}
	
	public void updateArticle(String title, String content, String seq) {
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, seq);
			
			psmt.executeUpdate();
			
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int updateComment(String content, String seq) {
		
		int result = 0;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_COMMENT);
			psmt.setString(1, content);
			psmt.setString(2, seq);
			
			result = psmt.executeUpdate();
			
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void updateArticleHit(String seq) {
		
		try{
			// 1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT);
			psmt.setString(1, seq);
			
			// 4단계
			psmt.executeUpdate();
			
			// 5단계
			// 6단계
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public void updateCommentCount(String seq, int type) {

		try{
			PreparedStatement psmt = null;
			
			// 1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			if(type == 1) {
				psmt = conn.prepareStatement(Sql.UPDATE_COMMENT_PLUS);
			}else {
				psmt = conn.prepareStatement(Sql.UPDATE_COMMENT_MINUS);
			}
			psmt.setString(1, seq);
			
			// 4단계
			psmt.executeUpdate();
			
			// 5단계
			// 6단계
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	public void updateFileDownload(String seq) {
		
		try{
			// 1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_FILE_DOWNLOAD);
			psmt.setString(1, seq);
			
			// 4단계
			psmt.executeUpdate();
			
			// 5단계
			// 6단계
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void deleteArticle(String seq) {

		try{
			// 1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_ARTICLE);
			psmt.setString(1, seq);
			psmt.setString(2, seq);
			
			// 4단계
			psmt.executeUpdate();
			
			// 5단계
			// 6단계
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void deleteComment(String seq) {
		
		try{
			// 1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_COMMENT);
			psmt.setString(1, seq);
			
			// 4단계
			psmt.executeUpdate();
			
			// 5단계
			// 6단계
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
