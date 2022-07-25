package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modele.CoordonneeM;

public class CoordonneeD implements IDao<CoordonneeM> {
	Connection connect = ConnectMySql.getConnection();

	@Override
	public boolean create(CoordonneeM coordonnee) {
		try {	
			PreparedStatement sql = connect.prepareStatement("INSERT INTO coordonnee (nom,adresse,telephone,email,logo) VALUES (?,?,?,?,?)");
			sql.setString(1, coordonnee.getNom()); 
			sql.setString(2, coordonnee.getAdresse()); 
			sql.setString(3, coordonnee.getTelephone()); 
			sql.setString(4, coordonnee.getEmail()); 
			sql.setString(5, coordonnee.getLogo()); 
			sql.executeUpdate(); 
			return true;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		return false;
	}

	@Override
	public ArrayList<CoordonneeM> read() {
		ArrayList<CoordonneeM> coordonnees = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM coordonnee");
			ResultSet res = sql.executeQuery(); 		
			while(res.next()) {								
				coordonnees.add( new CoordonneeM (res.getInt("id"), res.getString("nom"), res.getString("adresse"), 
				res.getString("telephone"),res.getString("email"),res.getString("logo")));
			}			
		} 
		catch (SQLException e) {
			e.printStackTrace();	
		}
		return coordonnees;
	}

	@Override
	public boolean update(CoordonneeM coordonnee, int id) {
		try {
			PreparedStatement sql = connect.prepareStatement("UPDATE coordonnee SET nom=?, adresse=?, telephone=?, email=?, logo=? "
			+ "WHERE id=?");
			sql.setString(1, coordonnee.getNom()); 
			sql.setString(2, coordonnee.getAdresse()); 
			sql.setString(3, coordonnee.getTelephone()); 
			sql.setString(4, coordonnee.getEmail()); 
			sql.setString(5, coordonnee.getLogo()); 
			sql.setInt(6, id);		
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
			PreparedStatement sql = connect.prepareStatement("DELETE FROM coordonnee WHERE id = ?");	
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
	public CoordonneeM findById(int id) {
		CoordonneeM coordonnee = null;		
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM coordonnee WHERE id= "+id+"");			
			ResultSet res = sql.executeQuery();			
			if(res.next()) {
				coordonnee = new CoordonneeM (res.getInt("id"), res.getString("nom"), res.getString("adresse"), 
				res.getString("telephone"),res.getString("email"),res.getString("logo"));			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return coordonnee;
	}

} // fin CoordonneeD
