package termp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.*;

//import java.util.Vector;

//import java.io.Serializable;


public class userbeanManager {
	private DBConnectionMgr pool;
	
	
	public userbeanManager(){
		try {
			pool=DBConnectionMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean checkId(String id){
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		boolean flag=false;
		
		try{
			con=pool.getConnection();
			sql="select id from userinfo where id =?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			flag=pstmt.executeQuery().next();
			System.out.println("flag= "+flag);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean insertUser(userbean bean){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql=null;
		boolean flag=false;
		
		//System.out.println(bean.getId());
		//System.out.println(bean.getPw());
		
		try{
			con=pool.getConnection();
			sql="insert into userinfo(id,pw) values(?,?)";
			//sql="insert into userinfo values(?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,bean.getId());
			pstmt.setString(2,bean.getPw());
			
			//System.out.println(bean.getId());
			//System.out.println(bean.getPw());
			
			if(pstmt.executeUpdate()==1)
				flag=true;
			
			System.out.println("flag="+flag);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public boolean loginUser(String id,String pw){
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		boolean flag=false;
		//System.out.println("id="+id+"pw="+pw);
		try{
			con=pool.getConnection();
			sql="select id from userinfo where id=? and pw=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			rs=pstmt.executeQuery();
			flag=rs.next();
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean writeUser1(String id,String pw,userbean bean){
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		boolean flag=false;
		try{
			con=pool.getConnection();
			sql="select id from userinfo where id=? and pw=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			rs=pstmt.executeQuery();
			flag=rs.next();
			
			if(flag){
			sql="update set userinfo game1_win=?,game1_lose=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,bean.getGame1_win());
		
			pstmt.setInt(2,bean.getGame1_lose());
			pstmt.setString(3, id);
			if(pstmt.executeUpdate()==1)
				flag=true;
			
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
		
}
public boolean writeUser2(String id,String pw,userbean bean){
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		boolean flag=false;
		try{
			con=pool.getConnection();
			sql="select id from userinfo where id=? and pw=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			rs=pstmt.executeQuery();
			flag=rs.next();
			
			if(flag){
			sql="update userinfo set game2_win=?,game2_draw=?,game2_lose=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,bean.getGame2_win());
			pstmt.setInt(2,bean.getGame2_draw());
			pstmt.setInt(3,bean.getGame2_lose());
			pstmt.setString(4,id);
			if(pstmt.executeUpdate()==1)
				flag=true;
			
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
		
}

	
	
}



