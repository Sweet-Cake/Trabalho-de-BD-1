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
import model.NotaQuesito;
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
		
		public String listaTotal() throws SQLException {
			Connection con = (Connection) GenericDao.getInstance().getConnection();
			PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("SELECT * FROM Escola ORDER BY totalPontos desc");
			ResultSet rs = pstmt.executeQuery();
			List<Escola> pontos = new ArrayList<Escola>();
			String msg = "<tr><td>ESCOLA</td><td>PONTUAÇÃO</td></tr>";
			while(rs.next()) {
				Escola np = new Escola();
				msg = msg + "<tr>";
				msg = msg + "<td>" + rs.getString("nome") + "</td>";
				msg = msg + "<td>" + rs.getDouble("totalPontos") + "</td>\n</tr>";
			}
			return msg;
		}
		
		public String listaNotas(int quesito) throws SQLException {
			Connection con = (Connection) GenericDao.getInstance().getConnection();
			PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("EXEC sp_vernotas ?");
			pstmt.setInt(1, quesito);
			ResultSet rs = pstmt.executeQuery();
			List<NotaQuesito> notas = new ArrayList<NotaQuesito>();
			String msg = "<tr>" +
							"<td>Escola</td>" +
							"<td>Nota 1</td>" +
							"<td>Nota 2</td>" +
							"<td>Nota 3</td>" +
							"<td>Nota 4</td>" +
							"<td>Nota 5</td>" +
							"<td>Maior Descartada</td>" +
							"<td>Menor Descartada</td>" +
							"<td>Total</td>" +
							"</tr>";
			while(rs.next()) {
				/*NotaQuesito nq = new NotaQuesito();
				nq.setEscola( rs.getString("nome") );
				nq.setN1( rs.getDouble("n1") );
				nq.setN2( rs.getDouble("n2") );
				nq.setN3( rs.getDouble("n3") );
				nq.setN4( rs.getDouble("n4") );
				nq.setN5( rs.getDouble("n5") );
				nq.setMaiorN( rs.getDouble("maior") );
				nq.setMenorN( rs.getDouble("menor") );
				nq.setTotal( rs.getDouble("total") );
				notas.add(nq);
				*/
				msg = msg +"<tr><td>" + rs.getString("nome") + "</td>";
				msg = msg + "<td>" + rs.getDouble("n1") + "</td>";
				msg = msg + "<td>" + rs.getDouble("n2") + "</td>";
				msg = msg + "<td>" + rs.getDouble("n3") + "</td>";
				msg = msg + "<td>" + rs.getDouble("n4") + "</td>";
				msg = msg + "<td>" + rs.getDouble("n5") + "</td>";
				msg = msg + "<td>" + rs.getDouble("maior") + "</td>";
				msg = msg + "<td>" + rs.getDouble("menor") + "</td>";
				msg = msg +"<td>" + rs.getDouble("total") + "</td></tr>";
			}
			return msg;
		}
		
		public void listanot() throws SQLException {
			Connection con = (Connection) GenericDao.getInstance().getConnection();
			PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("select nota from NotaQuesito where idJurado = 1 and idQuesito = 1 and idEscola = 1");
			ResultSet rs = pstmt.executeQuery();
			double pt = rs.getDouble("nota");
			System.out.println(pt);
		}

}
