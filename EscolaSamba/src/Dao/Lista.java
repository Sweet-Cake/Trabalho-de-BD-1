package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Escola;
import model.Jurado;
import model.Nota;
import model.Quesito;
public class Lista {
	

		Connection c;

		//Escola e=new Escola();
		
		
		public List<Escola> ListaEscola() throws SQLException {
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
		public List<Jurado> ListaJurado() throws SQLException {
			Connection con = (Connection) GenericDao.getInstance().getConnection();
			PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM Jurado");
			ResultSet rs = pstmt.executeQuery();
			List<Jurado> jurado = new ArrayList<Jurado>();
			while(rs.next()) { 
				Jurado j = new Jurado();
				j.setId(rs.getInt("id"));
				j.setNome( rs.getString("nome") );
				jurado.add(j);
			}
			return jurado;
		}
		
		public List<Quesito> ListaQuesito() throws SQLException {
			Connection con = (Connection) GenericDao.getInstance().getConnection();
			PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM Quesito");
			ResultSet rs = pstmt.executeQuery();
			List<Quesito> quesito = new ArrayList<Quesito>();
			while(rs.next()) { 
				Quesito q = new Quesito();
				q.setId(rs.getInt("id"));
				q.setNome( rs.getString("nome") );
				quesito.add(q);
			}
			return quesito;
		}
		
		public List<Escola> listaTotal() throws SQLException {
			Connection con = (Connection) GenericDao.getInstance().getConnection();
			PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM Escola ORDER BY totalPontos desc");
			ResultSet rs = pstmt.executeQuery();
			List<Escola> pontos = new ArrayList<Escola>();
			while(rs.next()) {
				Escola np = new Escola();
				np.setTotal( rs.getDouble("totalPontos") );
				np.setNome( rs.getString("nome") );
				pontos.add(np);
			}
			return pontos;
		}
		
		
}
