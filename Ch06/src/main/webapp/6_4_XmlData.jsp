<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sub1.MemberBean"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%

	//DB 정보
	String host = "jdbc:mysql://13.125.215.69:3306/a3539a";
	String user = "a3539a";
	String pass = "1234";
	
	List<MemberBean> list = new ArrayList<>();

	try{
		// 1 단계
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2 단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3 단계
		Statement stmt = conn.createStatement();
		
		// 4 단계
		String sql = "SELECT * FROM `MEMBER` ORDER BY `rdate`;";
		ResultSet rs = stmt.executeQuery(sql);
		
		// 5 단계
		while(rs.next()){
			
			MemberBean mb = new MemberBean();
			mb.setUid(rs.getString(1));
			mb.setName(rs.getString(2));
			mb.setHp(rs.getString(3));
			mb.setPos(rs.getString(4));
			mb.setDep(rs.getInt(5));
			mb.setRdate(rs.getString(6));
			
			list.add(mb);
		}
		// 6 단계
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// List를 XML 데이터로 변환
	Document doc = new Document();
	Element members = new Element("members");
	
	for(MemberBean mb : list){
		
		Element member  = new Element("member");
		Element uid 	= new Element("uid");
		Element name 	= new Element("name");
		Element hp 		= new Element("hp");
		Element pos 	= new Element("pos");
		Element dep 	= new Element("dep");
		Element rdate 	= new Element("rdate");
		
		uid.setText(mb.getUid());
		name.setText(mb.getName());
		hp.setText(mb.getHp());
		pos.setText(mb.getPos());
		dep.setText(""+mb.getDep());
		rdate.setText(mb.getRdate());
		
		member.addContent(uid);
		member.addContent(name);
		member.addContent(hp);
		member.addContent(pos);
		member.addContent(dep);
		member.addContent(rdate);
		
		members.addContent(member);
	}
	
	doc.setRootElement(members);
	
	// XML 출력
	XMLOutputter outputter = new XMLOutputter(Format.getPrettyFormat());
	String xml = outputter.outputString(doc);
	
	out.print(xml);
%>
