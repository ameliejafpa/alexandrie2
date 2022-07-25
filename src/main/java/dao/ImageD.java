package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modele.ImageM;
import modele.ProduitM;

public class ImageD implements IDao<ImageM>{
	Connection connect = ConnectMySql.getConnection();

	@Override
	public boolean create(ImageM image) {
		try {	
			PreparedStatement sql = connect.prepareStatement("INSERT INTO image (idProduit,url) VALUES (?,?)");
			sql.setInt(1, image.getIdProduit().getId()); 
			sql.setString(2, image.getUrl()); 
			sql.executeUpdate(); 
			return true;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		return false;
	}

	@Override
	public ArrayList<ImageM> read() {
		ArrayList<ImageM> listeImage = new ArrayList<>();
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM image INNER JOIN produit ON "
					+ "image.idProduit=produit.id");
			ResultSet res = sql.executeQuery(); 			
			while (res.next()) {
				ImageM image = new ImageM(res.getInt("image.id"),
						new ProduitM(res.getInt("produit.id"), res.getString("produit.titre")),
						res.getString("image.url"));
				listeImage.add(image);
			}			
		} 
		catch (SQLException e) {
			e.printStackTrace();	
		}
		return listeImage;
	}

	@Override
	public boolean update(ImageM image, int id) {
		try {
			PreparedStatement sql = connect.prepareStatement("UPDATE image SET idProduit=?, url=? WHERE id=?");		
			sql.setInt(1, image.getIdProduit().getId()); 
			sql.setString(2, image.getUrl());	
			sql.setInt(3, id);		
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
			PreparedStatement sql = connect.prepareStatement("DELETE FROM image WHERE id = ?");	
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
	public ImageM findById(int id) {
		ImageM image = null;		
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM image INNER JOIN produit ON "
					+ "image.idProduit=produit.id WHERE image.id= "+id+"");			
			ResultSet res = sql.executeQuery();			
			if(res.next()) {
				image = new ImageM(res.getInt("image.id"),
						new ProduitM(res.getInt("produit.id"), res.getString("produit.titre")),
						res.getString("image.url"));		
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return image;
	}
	
	public ArrayList<ImageM> findByIdProduct(int id) {
		ArrayList<ImageM> listeImages = new ArrayList<>();		
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM image INNER JOIN produit ON image.idProduit=produit.id WHERE produit.id= ?");	
			sql.setInt(1,id);	
			ResultSet res = sql.executeQuery();			
			while(res.next()) {
				ImageM image = new ImageM(res.getInt("image.id"),
						new ProduitM(res.getInt("produit.id"), res.getString("produit.titre")),
						res.getString("image.url"));
				listeImages.add(image);		
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return listeImages;
	}

} // fin ImageD
