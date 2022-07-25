package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modele.CategorieM;

public class CategorieD implements IDao<CategorieM>{
	
	Connection connect = ConnectMySql.getConnection();

	@Override
	public boolean create(CategorieM categorie) {
		try {	
			PreparedStatement sql = connect.prepareStatement("INSERT INTO categorie (titre) VALUES (?)");
			sql.setString(1, categorie.getTitre()); 
			sql.executeUpdate(); 
			return true;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		return false;
	}

	@Override
	public ArrayList<CategorieM> read() {
		ArrayList<CategorieM> categories = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM categorie");
			ResultSet res = sql.executeQuery(); 		
			while(res.next()) {								
				categories.add( new CategorieM (res.getInt("id"), res.getString("titre")));
			}			
		} 
		catch (SQLException e) {
			e.printStackTrace();	
		}
		return categories;
	}

	@Override
	public boolean update(CategorieM categorie, int id) {
		try {
			PreparedStatement sql = connect.prepareStatement("UPDATE categorie SET titre=? WHERE id=?");		
			sql.setString(1, categorie.getTitre());	
			sql.setInt(2, id);		
			sql.executeUpdate();		
			return true;		
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(int id) {
		try {
			PreparedStatement sql = connect.prepareStatement("DELETE FROM categorie WHERE id = ?");	
			sql.setInt(1,id);	
			sql.executeUpdate();		
			return true;			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public CategorieM findById(int id) {
		CategorieM categorie = null;		
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM categorie WHERE id= "+id+"");			
			ResultSet res = sql.executeQuery();			
			if(res.next()) {
				categorie = new CategorieM(res.getInt("id"),res.getString("titre"));			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return categorie;
	}

} // Fin CategorieD 
