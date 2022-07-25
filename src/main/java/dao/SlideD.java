package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modele.SlideM;

public class SlideD implements IDao<SlideM> {
	
	Connection connect = ConnectMySql.getConnection();

	@Override
	public boolean create(SlideM slide) {
		// TODO Auto-generated method stub
		try {
			
			PreparedStatement sql = connect.prepareStatement("INSERT INTO slide(titre, image, url) VALUES (?, ?, ?");
			
			sql.setString(1, slide.getTitre());
			sql.setString(2, slide.getImage());
			sql.setString(3, slide.getUrl());

			System.out.println(sql);
			sql.executeUpdate();
			return true;
			
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public ArrayList<SlideM> read() {
		// TODO Auto-generated method stub
		ArrayList<SlideM> slides = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM slide");
			ResultSet rs = sql.executeQuery();
			
			while (rs.next()) {
				SlideM slide = new SlideM();
				
				slide.setId(rs.getInt("id"));
				slide.setTitre(rs.getString("titre"));;
				slide.setImage(rs.getString("image"));
				slide.setUrl(rs.getString("url"));
				
				
				slides.add(slide);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return slides;
	}

	@Override
	public boolean update(SlideM slide, int id) {
		// TODO Auto-generated method stub
		try {
			PreparedStatement sql = connect.prepareStatement("UPDATE slide SET titre = ?, image = ?, url = ? WHERE id = ?");
			sql.setString(1, slide.getTitre());
			sql.setString(2, slide.getImage());
			sql.setString(3, slide.getUrl());
			sql.setInt(4, id);
			
			sql.executeUpdate();
			return true;
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		try {
			PreparedStatement sql = connect.prepareStatement("DELETE FROM slide WHERE id = ?");
			sql.setInt(1, id);
			sql.executeUpdate();
			return true;
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public SlideM findById(int id) {
		// TODO Auto-generated method stub
		SlideM slide = new SlideM();		

		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM slide WHERE id= ?");
			sql.setInt(1, id);
			ResultSet rs = sql.executeQuery();
			if (rs.next()) {

				slide.setTitre(rs.getNString("titre"));
				slide.setImage(rs.getString("image"));
				slide.setUrl(rs.getString("url"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return slide;
	}

}
