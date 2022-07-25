package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modele.FournisseurM;

public class FournisseurD implements IDao<FournisseurM>{
	Connection connect = ConnectMySql.getConnection();

	@Override
	public boolean create(FournisseurM fournisseur) {
		try {	
			PreparedStatement sql = connect.prepareStatement("INSERT INTO fournisseur (nom) VALUES (?)");
			sql.setString(1, fournisseur.getNom()); 
			sql.executeUpdate(); 
			return true;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		return false;
	}

	@Override
	public ArrayList<FournisseurM> read() {
		ArrayList<FournisseurM> fournisseurs = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM fournisseur");
			ResultSet res = sql.executeQuery(); 		
			while(res.next()) {								
				fournisseurs.add( new FournisseurM (res.getInt("id"), res.getString("nom")));
			}			
		} 
		catch (SQLException e) {
			e.printStackTrace();	
		}
		return fournisseurs;
	}

	@Override
	public boolean update(FournisseurM fournisseur, int id) {
		try {
			PreparedStatement sql = connect.prepareStatement("UPDATE fournisseur SET nom=? WHERE id=?");		
			sql.setString(1, fournisseur.getNom());	
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
			PreparedStatement sql = connect.prepareStatement("DELETE FROM fournisseur WHERE id = ?");	
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
	public FournisseurM findById(int id) {
		FournisseurM fournisseur = null;		
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM fournisseur WHERE id= "+id+"");			
			ResultSet res = sql.executeQuery();			
			if(res.next()) {
				fournisseur = new FournisseurM(res.getInt("id"),res.getString("nom"));			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return fournisseur;
	}

} // fin FournisseurD
