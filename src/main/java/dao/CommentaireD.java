package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modele.CommentaireM;
import modele.ProduitM;
import modele.UtilisateurM;

public class CommentaireD implements IDao<CommentaireM>{
	Connection connect = ConnectMySql.getConnection();

	@Override
	public boolean create(CommentaireM commentaire) {
		try {	
			PreparedStatement sql = connect.prepareStatement("INSERT INTO commentaire (commentaire,note,idProduit,idUtilisateur) "
					+ "VALUES (?,?,?,?)");
			sql.setString(1, commentaire.getCommentaire()); 
			sql.setInt(2, commentaire.getNote()); 
			sql.setInt(3, commentaire.getIdProduit().getId()); 
			sql.setInt(4, commentaire.getIdUtilisateur().getId()); 
			sql.executeUpdate(); 
			return true;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		return false;
	}

	@Override
	public ArrayList<CommentaireM> read() {
		ArrayList<CommentaireM> listeCommentaire = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM commentaire INNER JOIN produit ON "
					+ "commentaire.idProduit=produit.id INNER JOIN commentaire.idUtilisateur=utilisateur.id ");
			ResultSet res = sql.executeQuery(); 			
			while (res.next()) {
				CommentaireM commentaire = new CommentaireM(res.getInt("commentaire.id"), res.getString("commentaire.commentaire"), 
						res.getInt("commentaire.note"), new ProduitM(res.getInt("produit.id"), res.getString("produit.titre")),
						new UtilisateurM(res.getInt("utilisateur.id"),res.getString("nom"),res.getString("prenom"),res.getString("dateInscription"),
								res.getString("email"),res.getString("motDePasse")));
				listeCommentaire.add(commentaire);
			}			
		} 
		catch (SQLException e) {
			e.printStackTrace();	
		}
		return listeCommentaire;
	}

	@Override
	public boolean update(CommentaireM commentaire, int id) {
		try {
			PreparedStatement sql = connect.prepareStatement("UPDATE commentaire SET commentaire=?, note=?, idProduit=?, "
					+ "idUtilisateur=? WHERE id=?");		
			sql.setString(1, commentaire.getCommentaire()); 
			sql.setInt(2, commentaire.getNote()); 
			sql.setInt(3, commentaire.getIdProduit().getId()); 
			sql.setInt(4, commentaire.getIdUtilisateur().getId());  
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
			PreparedStatement sql = connect.prepareStatement("DELETE FROM commentaire WHERE id = ?");	
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
	public CommentaireM findById(int id) {
		CommentaireM commentaire = null;		
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM commentaire INNER JOIN produit ON "
					+ "commentaire.idProduit=produit.id INNER JOIN commentaire.idUtilisateur=utilisateur.id "
					+ "WHERE commentaire.id= "+id+"");			
			ResultSet res = sql.executeQuery();			
			if(res.next()) {
				commentaire =  new CommentaireM(res.getInt("commentaire.id"), res.getString("commentaire.commentaire"),
						res.getInt("commentaire.note"), new ProduitM(res.getInt("produit.id"), res.getString("produit.titre")),
						new UtilisateurM(res.getInt("utilisateur.id"),res.getString("nom"),res.getString("prenom"),res.getString("dateInscription"),
								res.getString("email"),res.getString("motDePasse")));	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return commentaire;
	}


} // fin CommentaireD
