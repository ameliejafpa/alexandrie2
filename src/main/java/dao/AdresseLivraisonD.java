package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modele.AdresseLivraisonM;
import modele.UtilisateurM;

public class AdresseLivraisonD implements IDao<AdresseLivraisonM>{
	
	Connection connect = ConnectMySql.getConnection();

	@Override
	public boolean create(AdresseLivraisonM adresseLivraison) {
		// TODO Auto-generated method stub
		try {
			
			PreparedStatement sql = connect.prepareStatement("INSERT INTO adresseLivraison(idUtilisateur, adresse, codePostal, ville, pays) VALUES (? , ?,  ?, ?, ?)");
			
			sql.setObject(1, adresseLivraison.getIdUtilisateur().getId());
			sql.setString(2, adresseLivraison.getAdresse());
			sql.setString(3, adresseLivraison.getCodePostal());
			sql.setString(4, adresseLivraison.getVille());
			sql.setString(5, adresseLivraison.getPays());
			System.out.println(sql);
			sql.executeUpdate();
			return true;
			
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public ArrayList<AdresseLivraisonM> read() {
		// TODO Auto-generated method stub
		ArrayList<AdresseLivraisonM> adressesLivraisons = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM adresseLivraison INNER JOIN utilisateur ON adresseLivraison.idUtilisateur = utilisateur.id");
			ResultSet rs = sql.executeQuery();
			
			while (rs.next()) {
				AdresseLivraisonM adresseLivraison = new AdresseLivraisonM();
				UtilisateurM utilisateur = new UtilisateurM(rs.getInt("utilisateur.id"),rs.getString("nom"),rs.getString("prenom"),rs.getString("dateInscription"),rs.getString("email"),rs.getString("motDePasse")	);
				
				adresseLivraison.setId(rs.getInt("adresseLivraison.id"));
				adresseLivraison.setIdUtilisateur(utilisateur);
				adresseLivraison.setAdresse(rs.getString("adresse"));
				adresseLivraison.setCodePostal(rs.getString("codePostal"));
				adresseLivraison.setVille(rs.getString("ville"));
				adresseLivraison.setPays(rs.getString("pays"));
				
				
				adressesLivraisons.add(adresseLivraison);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return adressesLivraisons;
	}

	@Override
	public boolean update(AdresseLivraisonM adresseLivraison, int id) {
		// TODO Auto-generated method stub
		try {
			PreparedStatement sql = connect.prepareStatement("UPDATE adresseLivraison SET idUtilisateur = ?, adresse = ?, codePostal = ?, ville = ?, pays = ? WHERE id = ?");
			sql.setInt(1, adresseLivraison.getIdUtilisateur().getId());
			sql.setString(2, adresseLivraison.getAdresse());
			sql.setString(3, adresseLivraison.getCodePostal());
			sql.setString(4, adresseLivraison.getVille());
			sql.setString(5, adresseLivraison.getPays());
			sql.setInt(6, id);
			
			sql.executeUpdate();
			return true;
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateByUserId(AdresseLivraisonM adresseLivraison, int id) {
		// TODO Auto-generated method stub
		try {
			PreparedStatement sql = connect.prepareStatement("UPDATE adresseLivraison SET adresse = ?, codePostal = ?, ville = ?, pays = ? WHERE idUtilisateur = ?");
			sql.setString(1, adresseLivraison.getAdresse());
			sql.setString(2, adresseLivraison.getCodePostal());
			sql.setString(3, adresseLivraison.getVille());
			sql.setString(4, adresseLivraison.getPays());
			sql.setInt(5, id);
			
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
			PreparedStatement sql = connect.prepareStatement("DELETE FROM adresseLivraison WHERE id = ?");
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
	public AdresseLivraisonM findById(int id) {
		// TODO Auto-generated method stub
		AdresseLivraisonM adresseLivraison = new AdresseLivraisonM();

		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM adresseLivraison INNER JOIN utilisateur ON adresseLivraison.idUtilisateur = utilisateur.id WHERE adresseLivraison.id= ?");
			sql.setInt(1, id);
			ResultSet rs = sql.executeQuery();
			if (rs.next()) {
				
				UtilisateurM utilisateur = new UtilisateurM(rs.getInt("utilisateur.id"),rs.getString("nom"),rs.getString("prenom"),rs.getString("dateInscription"),rs.getString("email"),rs.getString("motDePasse")	);
				adresseLivraison.setId(rs.getInt("adresseLivraison.id"));
				adresseLivraison.setIdUtilisateur(utilisateur);
				adresseLivraison.setAdresse(rs.getString("adresse"));
				adresseLivraison.setCodePostal(rs.getString("codePostal"));
				adresseLivraison.setVille(rs.getString("ville"));
				adresseLivraison.setPays(rs.getString("pays"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return adresseLivraison;
	}
	
	public AdresseLivraisonM findByUserId(int id) {
		// TODO Auto-generated method stub
		AdresseLivraisonM adresseLivraison = new AdresseLivraisonM();

		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM adresseLivraison INNER JOIN utilisateur ON adresseLivraison.idUtilisateur = utilisateur.id WHERE utilisateur.id= ?");
			sql.setInt(1, id);
			ResultSet rs = sql.executeQuery();
			if (rs.next()) {
				
				UtilisateurM utilisateur = new UtilisateurM(rs.getInt("utilisateur.id"),rs.getString("nom"),rs.getString("prenom"),rs.getString("dateInscription"),rs.getString("email"),rs.getString("motDePasse")	);
				adresseLivraison.setId(rs.getInt("adresseLivraison.id"));
				adresseLivraison.setIdUtilisateur(utilisateur);
				adresseLivraison.setAdresse(rs.getString("adresse"));
				adresseLivraison.setCodePostal(rs.getString("codePostal"));
				adresseLivraison.setVille(rs.getString("ville"));
				adresseLivraison.setPays(rs.getString("pays"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return adresseLivraison;
	}

}
