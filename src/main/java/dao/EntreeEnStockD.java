package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modele.EntreeEnStockM;
import modele.FournisseurM;
import modele.ProduitM;

public class EntreeEnStockD implements IDao<EntreeEnStockM>{
	Connection connect = ConnectMySql.getConnection();

	@Override
	public boolean create(EntreeEnStockM entreeEnStock) {
		try {	
			PreparedStatement sql = connect.prepareStatement("INSERT INTO entreeEnStock (idFournisseur,idProduit,dateE,quantite) "
					+ "VALUES (?,?,?,?)");
			sql.setInt(1, entreeEnStock.getIdFournisseur().getId()); 
			sql.setInt(2, entreeEnStock.getIdProduit().getId()); 
			sql.setString(3, entreeEnStock.getDateE()); 
			sql.setInt(4, entreeEnStock.getQuantite()); 
			sql.executeUpdate(); 
			return true;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		return false;
	}

	@Override
	public ArrayList<EntreeEnStockM> read() {
		ArrayList<EntreeEnStockM> listeEntreeEnStock = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM entreeEnStock INNER JOIN produit ON "
					+ "entreeEnStock.idProduit=produit.id INNER JOIN entreeEnStock.idFournisseur=fournisseur.id ");
			ResultSet res = sql.executeQuery(); 			
			while (res.next()) {
				EntreeEnStockM entreeEnStock = new EntreeEnStockM(res.getInt("entreeEnStock.id"), 
						new FournisseurM (res.getInt("fournisseur.id"), res.getString("fournisseur.nom")),
						new ProduitM(res.getInt("produit.id"), res.getString("produit.titre")),
						res.getString("entreeEnStock.dateE"),res.getInt("entreeEnStock.quantite") );
				listeEntreeEnStock.add(entreeEnStock);
			}			
		} 
		catch (SQLException e) {
			e.printStackTrace();	
		}
		return listeEntreeEnStock;
	}

	@Override
	public boolean update(EntreeEnStockM entreeEnStock, int id) {
		try {
			PreparedStatement sql = connect.prepareStatement("UPDATE entreeEnStock SET idFournisseur=?, idProduit=?,dateE=?, "
					+ "quantite=? WHERE id=?");		
			sql.setInt(1, entreeEnStock.getIdFournisseur().getId()); 
			sql.setInt(2, entreeEnStock.getIdProduit().getId()); 
			sql.setString(3, entreeEnStock.getDateE()); 
			sql.setInt(4, entreeEnStock.getQuantite()); 
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
			PreparedStatement sql = connect.prepareStatement("DELETE FROM entreeEnStock WHERE id = ?");	
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
	public EntreeEnStockM findById(int id) {
		EntreeEnStockM entreeEnStock = null;		
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM entreeEnStock INNER JOIN produit ON "
					+ "entreeEnStock.idProduit=produit.id INNER JOIN entreeEnStock.idFournisseur=fournisseur.id "
					+ "WHERE entreeEnStock.id= "+id+"");			
			ResultSet res = sql.executeQuery();			
			if(res.next()) {
				entreeEnStock =  new EntreeEnStockM(res.getInt("entreeEnStock.id"), 
						new FournisseurM (res.getInt("fournisseur.id"), res.getString("fournisseur.nom")),
						new ProduitM(res.getInt("produit.id"), res.getString("produit.titre")),
						res.getString("entreeEnStock.dateE"),res.getInt("entreeEnStock.quantite") );	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return entreeEnStock;
	}

}
