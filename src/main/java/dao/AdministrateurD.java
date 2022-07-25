package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modele.AdministrateurM;

public class AdministrateurD implements IDao<AdministrateurM>{
	Connection connect = ConnectMySql.getConnection();

	@Override
	public boolean create(AdministrateurM administrateur) {
		try {	
			PreparedStatement sql = connect.prepareStatement("INSERT INTO administrateur (nom, email, motDePasse, "
					+ "privilege) VALUES (?,?,SHA2(?,224),?)");
			sql.setString(1, administrateur.getNom()); 
			sql.setString(2, administrateur.getEmail()); 
			sql.setString(3, administrateur.getMotDePasse()); 
			sql.setString(4, administrateur.getPrivilege()); 
			sql.executeUpdate(); 
			return true;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		return false;
	}

	@Override
	public ArrayList<AdministrateurM> read() {
		ArrayList<AdministrateurM> administrateurs = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM administrateur");
			ResultSet res = sql.executeQuery(); 		
			while(res.next()) {								
				administrateurs.add( new AdministrateurM (res.getInt("id"), res.getString("nom"), res.getString("email"), 
				res.getString("motDePasse"),res.getString("privilege")));
			}			
		} 
		catch (SQLException e) {
			e.printStackTrace();	
		}
		return administrateurs;
	}

	@Override
	public boolean update(AdministrateurM administrateur, int id) {
		try {
			PreparedStatement sql = connect.prepareStatement("UPDATE administrateur SET nom=?, email=?, motDePasse=SHA2(?,224), "
			+ "privilege=? WHERE id=?");
			sql.setString(1, administrateur.getNom()); 
			sql.setString(2, administrateur.getEmail()); 
			sql.setString(3, administrateur.getMotDePasse()); 
			sql.setString(4, administrateur.getPrivilege()); 
			sql.setInt(5, id);		
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
			PreparedStatement sql = connect.prepareStatement("DELETE FROM administrateur WHERE id = ?");	
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
	public AdministrateurM findById(int id) {
		AdministrateurM administrateur = null;		
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM administrateur WHERE id= "+id+"");			
			ResultSet res = sql.executeQuery();			
			if(res.next()) {
				administrateur = new AdministrateurM (res.getInt("id"), res.getString("nom"), res.getString("email"), 
				res.getString("motDePasse"),res.getString("privilege"));			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return administrateur;
	}
	
	public AdministrateurM login(String email, String password, AdministrateurM administrateur) {
		
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM administrateur WHERE email=? AND motDePasse=SHA2(?,224)");
			sql.setString(1, email);
			sql.setString(2, password);		
			//System.out.println(sql);
			ResultSet res = sql.executeQuery();
				while(res.next()) {	
					administrateur.setId(res.getInt("id"));
					administrateur.setNom(res.getString("nom"));
					administrateur.setEmail(res.getString("email"));
					administrateur.setPrivilege(res.getString("privilege"));
				}	//fin while
				if (administrateur.getId()!=0) {
					return administrateur;				
				};	//fin if			
			}	//fin try
		catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

} // fin AdministrateurD
