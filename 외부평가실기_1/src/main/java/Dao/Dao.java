package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MemberDto;

public class Dao {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public Dao() {
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/xe","root","1234");
		}catch(Exception e) {System.out.println(e);}
	}
	
	
	public int get마지막번호() {
		String sql ="select max(custno) from member_tbl_02";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		}catch(Exception e) {}
		return 0;
	}
	public boolean 저장(MemberDto memberDto) {
		try {
			String sql = "insert into member_tbl_02 value(?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1,memberDto.getCustno());
			ps.setString(2,memberDto.getCustname());
			ps.setString(3,memberDto.getPhone());
			ps.setString(4,memberDto.getAddress());
			ps.setString(5,memberDto.getJoindate());
			ps.setString(6,memberDto.getGrade());
			ps.setString(7,memberDto.getCity());
			ps.executeUpdate();
			return true;
		}catch(Exception e){}
		return false;
		
	}
	
	public ArrayList<MemberDto> getmemberlist(){
		ArrayList<MemberDto> getmemberlist= new ArrayList<MemberDto>();
		try {
			String sql = "select * from member_tbl_02";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				MemberDto dto = new MemberDto(
						rs.getInt(1),rs.getString(2),
						rs.getString(3),rs.getString(4),
						rs.getString(5),rs.getString(6),
						rs.getString(7)
						);
				getmemberlist.add(dto);
			}
			return getmemberlist;
		}catch(Exception e) {}
		return null;
	}
	
	public ArrayList<MemberDto> getmoneylist(){
		ArrayList<MemberDto> getmoneylist= new ArrayList<MemberDto>();
		try {
			String sql = "SELECT A.custno , A.custname,A.grade,sum(B.price) FROM member_tbl_02 A join money_tbl_02 B on A.custno=B.custno group by (A.custno) order by sum(B.price) desc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				MemberDto dto = new  MemberDto();
				dto.setCustno(rs.getInt(1));
				dto.setCustname(rs.getString(2));
				dto.setGrade(rs.getString(3));
				dto.setPrice(rs.getInt(4));
				getmoneylist.add(dto);
			}
			return getmoneylist;
		}catch(Exception e) {}
		return null;
	}
	
	public MemberDto memberDto(int custno) {
		try {
			String sql = "select * from member_tbl_02 where custno="+custno;
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				MemberDto memberDto = new MemberDto(
						rs.getInt(1),rs.getString(2)
						,rs.getString(3),rs.getString(4)
						,rs.getString(5),rs.getString(6)
						,rs.getString(7)
						);
				return memberDto;
			}
		}catch(Exception e) {}
		return null;
	}
	
	public boolean update(MemberDto memberDto) {
		try {
			String sql ="update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno="+memberDto.getCustno();
			ps=con.prepareStatement(sql);
			ps.setString(1, memberDto.getCustname());
			ps.setString(2, memberDto.getPhone());
			ps.setString(3, memberDto.getAddress());
			ps.setString(4, memberDto.getJoindate());
			ps.setString(5, memberDto.getGrade());
			ps.setString(6, memberDto.getCity());
			ps.executeUpdate();
			return true;
		}catch(Exception e) {System.out.println(e);}
		return false;
	}
}
