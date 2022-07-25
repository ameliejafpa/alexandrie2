package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modele.ProduitM;
import modele.UtilisateurM;
import modele.VisiteM;

public class VisiteD implements IDao<VisiteM> {

	Connection connect = ConnectMySql.getConnection();

	@Override
	public boolean create(VisiteM visite) {
		// TODO Auto-generated method stub
try {
			
			PreparedStatement sql = connect.prepareStatement("INSERT INTO visite(idProduit, idUtilisateur, dateV) VALUES (?, ?, now()");
			
			sql.setObject(1, visite.getIdProduit().getId());
			sql.setObject(2, visite.getIdUtilisateur().getId());


			System.out.println(sql);
			sql.executeUpdate();
			return true;
			
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public ArrayList<VisiteM> read() {
		// TODO Auto-generated method stub
		ArrayList<VisiteM> visites = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM visite INNER JOIN produit ON visite.idProduit = produit.id INNER JOIN utilisateur ON visite.idUtilisateur = utilisateur.id");
			ResultSet rs = sql.executeQuery();
			
			while (rs.next()) {
				VisiteM visite = new VisiteM();
				UtilisateurM utilisateur = new UtilisateurM(rs.getInt("utilisateur.id"),rs.getString("nom"),rs.getString("prenom"),rs.getString("dateInscription"),rs.getString("email"),rs.getString("motDePasse"));
				ProduitM produit = new ProduitM(rs.getInt("produit.id"),rs.getString("titre"));
				

				visite.setId(rs.getInt("visite.id"));
				visite.setIdProduit(produit);
				visite.setIdUtilisateur(utilisateur);
				visite.setDateV(rs.getString("dateV"));
				
				
				visites.add(visite);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return visites;
	}

	@Override
	public boolean update(VisiteM visite, int id) {
		// TODO Auto-generated method stub
		try {
			PreparedStatement sql = connect.prepareStatement("UPDATE visite SET idProduit = ?, idUtilisateur = ? WHERE id = ?");
			sql.setInt(1, visite.getIdProduit().getId());
			sql.setInt(2, visite.getIdUtilisateur().getId());
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
			PreparedStatement sql = connect.prepareStatement("DELETE FROM visite WHERE id = ?");
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
	public VisiteM findById(int id) {
		// TODO Auto-generated method stub
		VisiteM visite = new VisiteM();
		

		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM visite INNER JOIN produit ON visite.idProduit = produit.id INNER JOIN utilisateur ON visite.idUtilisateur = utilisateur.id WHERE visite.id= ?");
			sql.setInt(1, id);
			ResultSet rs = sql.executeQuery();
			if (rs.next()) {
				
				UtilisateurM utilisateur = new UtilisateurM(rs.getInt("utilisateur.id"),rs.getString("nom"),rs.getString("prenom"),rs.getString("dateInscription"),rs.getString("email"),rs.getString("motDePasse"));
				ProduitM produit = new ProduitM(rs.getInt("produit.id"),rs.getString("titre"));

				visite.setId(rs.getInt("visite.id"));
				visite.setIdProduit(produit);
				visite.setIdUtilisateur(utilisateur);
				visite.setDateV(rs.getString("dateV"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return visite;
	}

}
