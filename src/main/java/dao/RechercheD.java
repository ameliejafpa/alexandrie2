package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modele.RechercheM;
import modele.UtilisateurM;

public class RechercheD implements IDao<RechercheM>{
	
	Connection connect = ConnectMySql.getConnection();

	@Override
	public boolean create(RechercheM recherche) {
		// TODO Auto-generated method stub
		try {
			
			PreparedStatement sql = connect.prepareStatement("INSERT INTO recherche(idUtilisateur, motCle, dateR) VALUES (? , ?, now()");
			
			sql.setObject(1, recherche.getIdUtilisateur().getId());
			sql.setString(2, recherche.getMotCle());
			System.out.println(sql);
			sql.executeUpdate();
			return true;
			
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public ArrayList<RechercheM> read() {
		// TODO Auto-generated method stub
		ArrayList<RechercheM> recherches = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM recherche INNER JOIN utilisateur ON recherche.idUtilisateur = utilisateur.id");
			ResultSet rs = sql.executeQuery();
			
			while (rs.next()) {
				RechercheM recherche = new RechercheM();
				UtilisateurM utilisateur = new UtilisateurM(rs.getInt("utilisateur.id"),rs.getString("nom"),rs.getString("prenom"),rs.getString("dateInscription"),rs.getString("email"),rs.getString("motDePasse")	);
				
				recherche.setId(rs.getInt("recherche.id"));
				recherche.setIdUtilisateur(utilisateur);
				recherche.setMotCle(rs.getString("motCle"));
				recherche.setDateR(rs.getString("dateR"));
				
				
				recherches.add(recherche);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return recherches;
	}

	@Override
	public boolean update(RechercheM recherche, int id) {
		// TODO Auto-generated method stub
		try {
			PreparedStatement sql = connect.prepareStatement("UPDATE recherche SET idUtilisateur = ?, motCle = ? WHERE id = ?");
			sql.setObject(1, recherche.getIdUtilisateur().getId());
			sql.setString(2, recherche.getMotCle());
			sql.setInt(3, id);
			
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
			PreparedStatement sql = connect.prepareStatement("DELETE FROM recherche WHERE id = ?");
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
	public RechercheM findById(int id) {
		// TODO Auto-generated method stub
		RechercheM recherche = new RechercheM();

		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM recherche INNER JOIN utilisateur ON recherche.idUtilisateur = utilisateur.id WHERE recherche.id= ?");
			sql.setInt(1, id);
			ResultSet rs = sql.executeQuery();
			if (rs.next()) {
				
				UtilisateurM utilisateur = new UtilisateurM(rs.getInt("utilisateur.id"),rs.getString("nom"),rs.getString("prenom"),rs.getString("dateInscription"),rs.getString("email"),rs.getString("motDePasse")	);
				recherche.setId(rs.getInt("recherche.id"));
				recherche.setIdUtilisateur(utilisateur);
				recherche.setMotCle(rs.getString("motCle"));
				recherche.setDateR(rs.getString("dateR"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return recherche;
	}

}
