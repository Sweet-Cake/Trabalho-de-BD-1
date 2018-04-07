package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.*;

public class Inserir {
	public void insert(Escola es, Quesito qs, Jurado j,Nota n) throws SQLException{
		Connection con = (Connection) GenericDao.getInstance().getConnection();
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("exec sp_addNota ?,?,?,?");
		ps.setString(1,es.getNome());
		ps.setString(2, j.getNome());
		ps.setString(3,qs.getNome());
		ps.setDouble(4,n.getNota());
		ps.execute();
		ps.close();
	}
}
