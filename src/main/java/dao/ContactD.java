package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modele.ContactM;
import modele.UtilisateurM;

public class ContactD implements IDao<ContactM>{
	
	Connection connect = ConnectMySql.getConnection();

	@Override
	public boolean create(ContactM contact) {
		// TODO Auto-generated method stub
		try {
			
			PreparedStatement sql = connect.prepareStatement("INSERT INTO contact(idUtilisateur, sujet, message, etat) VALUES (?, ?, ?, ?");
			
			sql.setObject(1, contact.getIdUtilisateur().getId());
			sql.setString(2, contact.getSujet());
			sql.setString(3, contact.getMessage());
			sql.setInt(4, contact.getEtat());

			System.out.println(sql);
			sql.executeUpdate();
			return true;
			
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public ArrayList<ContactM> read() {
		// TODO Auto-generated method stub
		ArrayList<ContactM> contacts = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM contact INNER JOIN utilisateur ON contact.idUtilisateur = utilisateur.id");
			ResultSet rs = sql.executeQuery();
			
			while (rs.next()) {
				ContactM contact = new ContactM();
				UtilisateurM utilisateur = new UtilisateurM(rs.getInt("utilisateur.id"),rs.getString("nom"),rs.getString("prenom"),rs.getString("dateInscription"),rs.getString("email"),rs.getString("motDePasse")	);
				
				contact.setId(rs.getInt("contact.id"));
				contact.setIdUtilisateur(utilisateur);
				contact.setSujet(rs.getString("sujet"));
				contact.setMessage(rs.getString("message"));
				contact.setEtat(rs.getInt("etat"));
				
				
				contacts.add(contact);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return contacts;
	}

	@Override
	public boolean update(ContactM contact, int id) {
		// TODO Auto-generated method stub
		try {
			PreparedStatement sql = connect.prepareStatement("UPDATE contact SET idUtilisateur = ?, sujet = ?, message =?, etat =? WHERE id = ?");
			sql.setObject(1, contact.getIdUtilisateur().getId());
			sql.setString(2, contact.getSujet());
			sql.setString(3, contact.getMessage());
			sql.setInt(4, contact.getEtat());
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
			PreparedStatement sql = connect.prepareStatement("DELETE FROM contact WHERE id = ?");
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
	public ContactM findById(int id) {
		// TODO Auto-generated method stub
		ContactM contact = new ContactM();

		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM contact INNER JOIN utilisateur ON contact.idUtilisateur = utilisateur.id WHERE contact.id= ?");
			sql.setInt(1, id);
			ResultSet rs = sql.executeQuery();
			if (rs.next()) {
				
				UtilisateurM utilisateur = new UtilisateurM(rs.getInt("utilisateur.id"),rs.getString("nom"),rs.getString("prenom"),rs.getString("dateInscription"),rs.getString("email"),rs.getString("motDePasse")	);
				contact.setId(rs.getInt("contact.id"));
				contact.setIdUtilisateur(utilisateur);
				contact.setSujet(rs.getString("sujet"));
				contact.setMessage(rs.getString("message"));
				contact.setEtat(rs.getInt("etat"));
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return contact;
	}

}
