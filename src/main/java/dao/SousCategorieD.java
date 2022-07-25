package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modele.CategorieM;
import modele.SousCategorieM;

public class SousCategorieD implements IDao<SousCategorieM> {
	Connection connect = ConnectMySql.getConnection();
	
	@Override
	public boolean create(SousCategorieM sousCategorie) {
		try {	
			PreparedStatement sql = connect.prepareStatement("INSERT INTO sousCategorie (titre,idCategorie) VALUES (?,?)");
			sql.setString(1, sousCategorie.getTitre()); 
			sql.setInt(2, sousCategorie.getIdCategorie().getId()); 
			sql.executeUpdate(); 
			return true;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		return false;
	}

	@Override
	public ArrayList<SousCategorieM> read() {
		ArrayList<SousCategorieM> listeSousCategorie = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM sousCategorie INNER JOIN categorie ON sousCategorie.idCategorie=categorie.id");
			ResultSet res = sql.executeQuery(); 			
			while (res.next()) {
				SousCategorieM sousCategorie = new SousCategorieM(res.getInt("sousCategorie.id"),res.getString("sousCategorie.titre"), 
					new CategorieM(res.getInt("categorie.id"), res.getString("categorie.titre")));
					listeSousCategorie.add(sousCategorie);
			}			
		} 
		catch (SQLException e) {
			e.printStackTrace();	
		}
		return listeSousCategorie;
	}

	@Override
	public boolean update(SousCategorieM sousCategorie, int id) {
		try {
			PreparedStatement sql = connect.prepareStatement("UPDATE sousCategorie SET titre=?, idCategorie=? WHERE id=?");		
			sql.setString(1, sousCategorie.getTitre());	
			sql.setInt(2, sousCategorie.getIdCategorie().getId()); 
			sql.setInt(3, id);		
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
			PreparedStatement sql = connect.prepareStatement("DELETE FROM sousCategorie WHERE id = ?");	
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
	public SousCategorieM findById(int id) {
		SousCategorieM sousCategorie = null;		
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM sousCategorie INNER JOIN categorie "
					+ "ON sousCategorie.idCategorie=categorie.id WHERE sousCategorie.id= "+id+"");			
			ResultSet res = sql.executeQuery();			
			if(res.next()) {
				sousCategorie = new SousCategorieM(res.getInt("sousCategorie.id"),res.getString("sousCategorie.titre"), 
						new CategorieM(res.getInt("categorie.id"), res.getString("categorie.titre")));			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return sousCategorie;
	}

} // fin SousCategorieD
