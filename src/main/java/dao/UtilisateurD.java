package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modele.UtilisateurM;

public class UtilisateurD implements IDao<UtilisateurM> {
	
	Connection connect = ConnectMySql.getConnection();

	@Override
	public boolean create(UtilisateurM utilisateur) {
		// TODO Auto-generated method stub
		try {
			
			PreparedStatement sql = connect.prepareStatement("INSERT INTO utilisateur(nom,prenom, dateInscription, email, motDePasse) VALUES (? , ?, now(), ?, SHA2(?,224))");
			
			sql.setString(1, utilisateur.getNom());
			sql.setString(2, utilisateur.getPrenom());
			sql.setString(3, utilisateur.getEmail());
			sql.setString(4, utilisateur.getMotDePasse());
			System.out.println(sql);
			sql.executeUpdate();
			return true;
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public ArrayList<UtilisateurM> read() {
		// TODO Auto-generated method stub
		ArrayList<UtilisateurM> utilisateurs = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM utilisateur");
			ResultSet rs = sql.executeQuery();
			
			while (rs.next()) {
				UtilisateurM utilisateur = new UtilisateurM();
				
				utilisateur.setNom(rs.getString("nom"));
				utilisateur.setPrenom(rs.getString("prenom"));
				utilisateur.setDateInscription(rs.getString("dateInscription"));
				utilisateur.setEmail(rs.getString("email"));
				utilisateur.setMotDePasse(rs.getString("motDePasse"));
				
				
				utilisateurs.add(utilisateur);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return utilisateurs;
	}

	@Override
	public boolean update(UtilisateurM utilisateur, int id) {
		// TODO Auto-generated method stub
		try {
			
			PreparedStatement sql = connect.prepareStatement("UPDATE utilisateur SET nom = ?, prenom = ?, email = ?, motdepasse = SHA2(?,224) WHERE id = ?");
			
			sql.setString(1, utilisateur.getNom());
			sql.setString(2, utilisateur.getPrenom());
			sql.setString(3, utilisateur.getEmail());
			sql.setString(4, utilisateur.getMotDePasse());
			sql.setInt(5, id);
			
			sql.executeUpdate();
			return true;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateWithoutPassword(UtilisateurM utilisateur, int id) {
		// TODO Auto-generated method stub
		try {
			
			PreparedStatement sql = connect.prepareStatement("UPDATE utilisateur SET nom = ?, prenom = ?, email = ? WHERE id = ?");
			
			sql.setString(1, utilisateur.getNom());
			sql.setString(2, utilisateur.getPrenom());
			sql.setString(3, utilisateur.getEmail());
			sql.setInt(4, id);
			
			sql.executeUpdate();
			return true;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		try {
			PreparedStatement sql = connect.prepareStatement("DELETE FROM utilisateur WHERE id=? AND id!=1");
			sql.setInt(1, id);
			sql.executeUpdate();
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public UtilisateurM findById(int id) {
		// TODO Auto-generated method stub
		UtilisateurM utilisateur = new UtilisateurM();

		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM utilisateur WHERE id=?");
			sql.setInt(1, id);
			ResultSet rs = sql.executeQuery();
			if (rs.next()) {

				utilisateur.setId(rs.getInt("id"));
				utilisateur.setNom(rs.getString("nom"));
				utilisateur.setPrenom(rs.getString("prenom"));
				utilisateur.setEmail(rs.getString("email"));
				utilisateur.setDateInscription(rs.getString("dateInscription"));
				utilisateur.setMotDePasse(rs.getString("motdepasse"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return utilisateur;
	}

	public UtilisateurM connexion(String email,String password) {
		try {
		
				PreparedStatement sql  = connect.prepareStatement("SELECT * FROM utilisateur WHERE email=? AND motDePasse=SHA2(?,224)");
				sql.setString(1,email);
				sql.setString(2,password);
				ResultSet rs = sql.executeQuery();
				UtilisateurM utilisateur = new UtilisateurM();
				if(rs.next()) {
					utilisateur.setId(rs.getInt( "id" ));
					utilisateur.setNom(rs.getString( "nom" ));
					utilisateur.setPrenom(rs.getString( "prenom" ));
					utilisateur.setEmail(rs.getString( "email" ));
					utilisateur.setMotDePasse(rs.getString( "motDePasse" ));
					return utilisateur;
				}else {
					return null;
				}
		} catch (Exception ex) {
        	ex.printStackTrace();
        	return null;
        }
	}
	

}
