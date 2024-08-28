package com.java.www;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class MemberDao {
	Context context;
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String query; 
	Member member;
	private String id, pw, name, phone, gender, hobbys;
	// selectLogin
	//-> query ="select * from member id=? and pw=?";
	
	public Member selectLogin(String uid, String upw) {
		try {

			conn = getConnection(); 
			query = "select * from member where id=? and pw=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uid);
			pstmt.setString(2, upw);
			rs = pstmt.executeQuery(); 
			while(rs.next()) {
				// member객체 m을 만들어서 return. 
				// id, pw 객체를 만들면됨. 
				// 생성자 . jdate빼고 다 있는 생성자. 
				// 생성자를 만듦 id, pw만 있는 생성자 만들기 
				// 기본생성자로 멤버 만든 후 setter를 사용해서 값 넣기
				
				// db에서 컬럼에 해당하는 값 가져오기 
				id = rs.getString("id");
				pw = rs.getString("pw");
				member = new Member(id, pw);
			}
		}catch(Exception e) { e.printStackTrace();}
		finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e2) {e2.printStackTrace();}
		}
		
		
		return member;
	}
			
			
			
			
	
	
	
	
	private Connection getConnection() {
		Connection connection=null;
		try {
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle8");
			connection = ds.getConnection();
		} catch( Exception e ) {e.printStackTrace();}
		return connection;
	}

}