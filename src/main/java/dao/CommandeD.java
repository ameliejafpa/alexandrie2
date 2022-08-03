package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modele.AdresseLivraisonM;
import modele.CommandeM;
import modele.UtilisateurM;

public class CommandeD implements IDao<CommandeM> {

	Connection connect = ConnectMySql.getConnection();

	@Override
	public boolean create(CommandeM commande) {
		// TODO Auto-generated method stub
		try {

			PreparedStatement sql = connect.prepareStatement(
					"INSERT INTO commande(idUtilisateur, dateC, total, idAdresse, etat) VALUES (?, now(), ?, ?, ?");

			sql.setObject(1, commande.getIdUtilisateur().getId());
			sql.setFloat(2, commande.getTotal());
			sql.setObject(3, commande.getIdAdresse().getId());
			sql.setInt(4, commande.getEtat());

			System.out.println(sql);
			sql.executeUpdate();
			return true;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public ArrayList<CommandeM> read() {
		// TODO Auto-generated method stub
		ArrayList<CommandeM> commandes = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement(
					"SELECT * FROM commande INNER JOIN utilisateur ON commande.idUtilisateur = utilisateur.id INNER JOIN adresseLivraison ON commande.idAdresse = adresseLivraison.id");
			ResultSet rs = sql.executeQuery();

			while (rs.next()) {
				CommandeM commande = new CommandeM();
				UtilisateurM utilisateur = new UtilisateurM(rs.getInt("utilisateur.id"),
						rs.getString("utilisateur.nom"), rs.getString("utilisateur.prenom"),
						rs.getString("utilisateur.dateInscription"), rs.getString("utilisateur.email"),
						rs.getString("utilisateur.motDePasse"));
				AdresseLivraisonM adresseLivraison = new AdresseLivraisonM(rs.getInt("adresseLivraison.id"),
						utilisateur, rs.getString("adresseLivraison.adresse"),
						rs.getString("adresseLivraison.codePostal"), rs.getString("adresseLivraison.ville"),
						rs.getString("adresseLivraison.pays"));

				commande.setId(rs.getInt("commande.id"));
				commande.setIdUtilisateur(utilisateur);
				commande.setDateC(rs.getString("commande.dateC"));
				commande.setTotal(rs.getFloat("commande.total"));
				commande.setIdAdresse(adresseLivraison);
				commande.setEtat(rs.getInt("commande.etat"));

				commandes.add(commande);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return commandes;
	}

	@Override
	public boolean update(CommandeM commande, int id) {
		// TODO Auto-generated method stub
		try {
			PreparedStatement sql = connect.prepareStatement(
					"UPDATE commande SET idUtilisateur = ?, total = ?, idAdresse = ?, etat = ?, dateC = ? WHERE id = ?");
			sql.setInt(1, commande.getIdUtilisateur().getId());
			sql.setFloat(2, commande.getTotal());
			sql.setInt(3, commande.getIdAdresse().getId());
			sql.setInt(4, commande.getEtat());
			sql.setString(5, commande.getDateC());
			sql.setInt(6, id);

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
			PreparedStatement sql = connect.prepareStatement("DELETE FROM commande WHERE id = ?");
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
	public CommandeM findById(int id) {
		// TODO Auto-generated method stub
		CommandeM commande = new CommandeM();

		try {
			PreparedStatement sql = connect.prepareStatement(
					"SELECT * FROM commande INNER JOIN utilisateur ON commande.idUtilisateur = utilisateur.id INNER JOIN adresseLivraison ON commande.idAdresse = adresseLivraison.id WHERE commande.id= ?");
			sql.setInt(1, id);
			ResultSet rs = sql.executeQuery();
			if (rs.next()) {

				UtilisateurM utilisateur = new UtilisateurM(rs.getInt("utilisateur.id"),
						rs.getString("utilisateur.nom"), rs.getString("utilisateur.prenom"),
						rs.getString("utilisateur.dateInscription"), rs.getString("utilisateur.email"),
						rs.getString("utilisateur.motDePasse"));
				AdresseLivraisonM adresseLivraison = new AdresseLivraisonM(rs.getInt("adresseLivraison.id"),
						utilisateur, rs.getString("adresseLivraison.adresse"),
						rs.getString("adresseLivraison.codePostal"), rs.getString("adresseLivraison.ville"),
						rs.getString("adresseLivraison.pays"));

				commande.setId(rs.getInt("commande.id"));
				commande.setIdUtilisateur(utilisateur);
				commande.setDateC(rs.getString("commande.dateC"));
				commande.setTotal(rs.getFloat("commande.total"));
				commande.setIdAdresse(adresseLivraison);
				commande.setEtat(rs.getInt("commande.etat"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return commande;
	}

}
