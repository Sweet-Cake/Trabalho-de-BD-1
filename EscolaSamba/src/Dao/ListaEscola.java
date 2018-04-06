package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Escola;
public class ListaEscola {
	

		Connection c;

		//Escola e=new Escola();
		
		
		public List<Escola> Lista() throws SQLException {
			Connection con = (Connection) GenericDao.getInstance().getConnection();
			PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM Escola");
			ResultSet rs = pstmt.executeQuery();
			List<Escola> escola = new ArrayList<Escola>();
			while(rs.next()) { 
				Escola e = new Escola();
				e.setId(rs.getInt("id"));
				e.setNome( rs.getString("nome") );
				escola.add(e);
			}
			return escola;
		}
		
		/*public List<Escola> Lista() {
			List<Escola> listaEscola = new ArrayList<>();
			try {
				String sql = "select * from Escola";
				PreparedStatement ps = c.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Escola e = new Escola();
					e.setNome(rs.getString("nome"));
					listaEscola.add(e);
				}
				ps.execute();
				ps.close();
			} catch (SQLException ex) {
			}
			return listaEscola;
		}*/
}
