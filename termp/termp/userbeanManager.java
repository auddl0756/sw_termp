package termp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;

//import java.util.Vector;

//import java.io.Serializable;
import java.util.*;



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
			sql="update userinfo set game1_win=?,game1_draw=?,game1_lose=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,bean.getGame1_win());
			pstmt.setInt(2,bean.getGame1_draw());
			pstmt.setInt(3,bean.getGame1_lose());
			pstmt.setString(4, id);
			
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


public Map<String,Integer> userRank2(){
	//int[] game1_win = new int[100];
	int[] game2_win = new int[100];
	//String[] id = new String[100];
	String[] id2 = new String[100];
	//int tmp;
	//String tmp1;
	int i=0;
	Map<String,Integer> hashMap1 = new HashMap<String,Integer>();
	Map<String,Integer> hashMap2 = new HashMap<String,Integer>();

	try {
	Connection con = pool.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT game2_win,id FROM userinfo");
	//ResultSetMetaData md = rs.getMetaData();
	
	
	while(rs.next()){
			//id[i]=rs.getString("id");
			id2[i]=rs.getString("id");
			//game1_win[i] = rs.getInt("game1_win");
			game2_win[i] = rs.getInt("game2_win");
			//hashMap1.put(id[i],game1_win[i]);
			hashMap1.put(id2[i],game2_win[i]);	
			i++;
	}
	rs.close();
	stmt.close();
	
	
	
	}catch(Exception e) {
		e.printStackTrace();
	}
		
	return hashMap1;
	
}

public Map<String,Integer> userRank1(){
	int[] game1_win = new int[100];
	//int[] game2_win = new int[100];
	String[] id = new String[100];
	//String[] id2 = new String[100];
	int tmp;
	String tmp1;
	int i=0;
	Map<String,Integer> hashMap1 = new HashMap<String,Integer>();
	Map<String,Integer> hashMap2 = new HashMap<String,Integer>();

	try {
	Connection con = pool.getConnection();
	Statement stmt = con.createStatement();
	//ResultSet rs = stmt.executeQuery("SELECT game1_win,game2_win,id FROM userinfo");
	ResultSet rs = stmt.executeQuery("SELECT game1_win,id FROM userinfo");
	ResultSetMetaData md = rs.getMetaData();
	
	while(rs.next()){
			id[i]=rs.getString("id");
			//id2[i]=rs.getString("id");
			game1_win[i] = rs.getInt("game1_win");
			//game2_win[i] = rs.getInt("game2_win");
			hashMap1.put(id[i],game1_win[i]);
			//hashMap2.put(id2[i],game2_win[i]);	
			i++;
	}
	rs.close();
	stmt.close();

	
	
	}catch(Exception e) {
		e.printStackTrace();
	}
		
	
	return hashMap1;
	
}

	
}

