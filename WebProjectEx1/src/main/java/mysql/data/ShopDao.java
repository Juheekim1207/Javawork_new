package mysql.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

public class ShopDao {
	DbConnect db = new DbConnect();
	
	//insert
	public void shopInsert(ShopDto dto)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into shop (sangpum, photo, price, color, cnt, ipgoday) values (?,?,?,?,?,?)";
	
		conn = db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getSangpum());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getColor());
			pstmt.setInt(5, dto.getCnt());
			pstmt.setString(6, dto.getIpgoday());
			
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(pstmt, conn);
		}
		
	}

	//list
	public List<ShopDto> getSangpumList()
	{
		List<ShopDto> list = new Vector<ShopDto>();
		String sql = "select * from shop order by num desc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				ShopDto dto = new ShopDto();
				dto.setNum(rs.getString("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setColor(rs.getString("color"));
				dto.setPhoto(rs.getString("Photo"));
				dto.setPrice(rs.getInt("price"));
				dto.setCnt(rs.getInt("num"));
				dto.setIpgoday(rs.getString("ipgoday"));
				
				//list에 추가
				list.add(dto);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(rs, pstmt, conn);
		}
		return list;
		
	}
	
	//num 에 해당하는 dto 반환
	public ShopDto getSangpum(String num)
	{
		ShopDto dto = new ShopDto();
		String sql = "select * from shop where num=?"; //num에 해당되는 전체데이터 받기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);		
			//바인딩
			pstmt.setString(1, num); // ?에 값 넣기
			//실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setColor(rs.getString("color"));
				dto.setPhoto(rs.getString("Photo"));
				dto.setPrice(rs.getInt("price"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setIpgoday(rs.getString("ipgoday"));
			}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(rs, pstmt, conn);
		}
		return dto;
		}
	
	
	//delete
	public void shopDelete(String num)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from shop where num=?";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, num);
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(pstmt, conn);
		}
	}
	
	//수정
		public void shopUpdate(ShopDto dto)
		{
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "update shop set sangpum=?, color=?, price=?, cnt=?, ipgoday=?, photo=? where num=?";
			
		
			conn = db.getConnection();
			try {
				pstmt = conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, dto.getSangpum());
				pstmt.setString(2, dto.getColor());
				pstmt.setInt(3, dto.getPrice());
				pstmt.setInt(4, dto.getCnt());
				pstmt.setString(5, dto.getIpgoday());
				pstmt.setString(6, dto.getPhoto());
				pstmt.setString(7, dto.getNum());
				
				//실행
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbCLose(pstmt, conn);
			}
		}
}
	
	
	
	
	
	
	
	
	
	
	
	











