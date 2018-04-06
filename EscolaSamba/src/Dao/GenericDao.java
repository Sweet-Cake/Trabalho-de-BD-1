package Dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class GenericDao {

	private static Connection con;
	private static GenericDao gdao;

	public Connection getConnection() {

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;user=user;password=123456");
			System.out.println("Conexao ok");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public void fechaConexao() {
		try {
			if (con != null)
				con.close();
			con = null;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static GenericDao getInstance() { 
		if (gdao == null) { 
			gdao = new GenericDao();
		}
		return gdao;
	}
}