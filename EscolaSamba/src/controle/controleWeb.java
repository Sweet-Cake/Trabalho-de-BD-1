package controle;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Inserir;
import model.*;

/**
 * Servlet implementation class controleWeb
 */
@WebServlet("/controleWeb")
public class controleWeb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public controleWeb() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		Inserir inserir=new Inserir();
		if("INSERIR".equalsIgnoreCase(cmd)) {
			Escola es=new Escola();
			Quesito qs= new Quesito();
			Jurado jr=new Jurado();
			Nota nt = new Nota();
			es.setNome(request.getParameter("Escola"));
			qs.setNome(request.getParameter("Quesito"));
			jr.setNome(request.getParameter("Jurado"));
			nt.setNota(Double.parseDouble(request.getParameter("Nota")));
			try {
				inserir.insert(es, qs, jr, nt);
				System.out.println("Passei por aqui");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			System.out.println("Ur a fool");
		}
		RequestDispatcher rd = request.getRequestDispatcher("./index.jsp");
		rd.forward(request, response);
	}

}
