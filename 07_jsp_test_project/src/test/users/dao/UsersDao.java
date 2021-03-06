package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.util.DbcpBean;

import test.users.dto.UsersDto;

public class UsersDao {
	private static UsersDao dao;
	private UsersDao() {}
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();			
		}
		return dao;
	}
	
	//프로필 이미지 경로를 수정하는 메소드 (updateProfile)
	public boolean updateProfile(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert,update,delete 문 구성
			String sql = "UPDATE users"
					+ " SET profile=?"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 내용이 있으면 바인딩한다.
			pstmt.setString(1, dto.getProfile());
			pstmt.setString(2, dto.getId());
			flag = pstmt.executeUpdate();//sql문 실행하고 변화된 row 갯수 리턴하기
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//회원의 비밀번호를 수정하는 메소드 (updatePwd)
	public boolean updatePwd(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert,update,delete 문 구성
			String sql = "UPDATE users"
					+ " SET pwd=?"
					+ " WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 내용이 있으면 바인딩한다.
			pstmt.setString(1, dto.getNewPwd());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());
			flag = pstmt.executeUpdate();//sql문 실행하고 변화된 row 갯수 리턴하기
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//회원 가입 정보를 수정 반영하는 메소드 (update)
	public boolean update(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert,update,delete 문 구성
			String sql = "UPDATE users"
					+ " SET email=?"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 내용이 있으면 바인딩한다.
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getId());
			flag = pstmt.executeUpdate();//sql문 실행하고 변화된 row 갯수 리턴하기
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//인자로 전달된 아이디(id)가 DB에 존재하는지 여부를 리턴하는 메소드 (isExist)
	public boolean isExist(String id) {
		boolean isExist =false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT *"
					+ " FROM users"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할게 있으면 여기서 바인딩 한다.
			pstmt.setString(1, id);
			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문 돌면서 ResultSet 에서 data 추출
			while (rs.next()) {
				isExist=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return isExist;
	}
	
	//인자로 전달된 정보가 유효한 정보인지 여부를 리턴하는 메소드  (isValid)
	public boolean isValid(UsersDto dto) {
		boolean isValid=false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT id"
					+ " FROM users"
					+ " WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할게 있으면 여기서 바인딩 한다.
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문 돌면서 ResultSet 에서 data 추출
			if (rs.next()) {
				isValid=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return isValid;
	}
	
	//인자로 전달된 아이디(id)에 해당하는 가입정보를 리턴해주는 메소드  (getData)
	public UsersDto getData(String id) {
		UsersDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT pwd,email,profile,regdate"
					+ " FROM users"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할게 있으면 여기서 바인딩 한다.
			pstmt.setString(1, id);
			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문 돌면서 ResultSet 에서 data 추출
			if (rs.next()) {
				dto=new UsersDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegdate(rs.getString("regdate"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	//인자로 전달된 아이디(id)에 해당하는 가입정보를 삭제하는 메소드 (delete)
	public boolean delete(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert,update,delete 문 구성
			String sql = "DELETE FROM uesrs"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 내용이 있으면 바인딩한다.
			pstmt.setString(1, id);
			flag = pstmt.executeUpdate();//sql문 실행하고 변화된 row 갯수 리턴하기
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//회원의 정보를 저장하는 메소드 (insert)
	public boolean insert(UsersDto dto) { 
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert,update,delete 문 구성
			String sql = "INSERT INTO users"
					+ " (id,pwd,email,regdate)"
					+ " VALUES(?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 내용이 있으면 바인딩한다.
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			flag = pstmt.executeUpdate();//sql문 실행하고 변화된 row 갯수 리턴하기
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
}
