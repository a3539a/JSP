package kr.co.jboard2.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import kr.co.jboard2.db.DBConfig;
import kr.co.jboard2.db.Sql;
import kr.co.jboard2.vo.TermsVo;

public class MemberDao {

	private static MemberDao instance = new MemberDao();
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	public void insertMember() {}
	public TermsVo selectTerms() {
		TermsVo tv = new TermsVo();
		
		try{
			// 1,2�ܰ�
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3�ܰ�	
			Statement stmt = conn.createStatement();
			
			// 4�ܰ�
			ResultSet rs = stmt.executeQuery(Sql.SELECT_TERMS);

			// 5�ܰ�	
			if(rs.next()){
				tv.setTerms(rs.getString(1));
				tv.setPrivacy(rs.getString(2));
			}
			
			// 6�ܰ�	
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return tv;
	}
	public void selectMember() {}
	public void selectMembers() {}
	public void updateMember() {}
	public void deleteMember() {}
}
