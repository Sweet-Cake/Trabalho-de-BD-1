package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

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
		Inserir inserir=new Inserir();
		String msg;
			Escola es=new Escola();
			Quesito qs= new Quesito();
			Jurado jr=new Jurado();
			Nota nt = new Nota();
			es.setNome(request.getParameter("Escola"));
			qs.setNome(request.getParameter("Quesito"));
			jr.setNome(request.getParameter("Jurado"));	
			try{
				nt.setNota(Double.parseDouble(request.getParameter("Nota")));
				System.out.println("puchi");
				try {
					inserir.insert(es, qs, jr, nt);
					System.out.println("Passei por aqui"); 
					response.setContentType("text/plain");
					Double nota=Double.parseDouble(request.getParameter("Nota"));
					PrintWriter sair = response.getWriter();
				    sair.print("NOTA ADICIONADA COM SUCESSO!"+nota);
					/*msg = String.format("Nota para a escola %s inserida com sucesso!", es.nome);
					request.getSession().setAttribute("MENSAGEM", msg);
					response.sendRedirect("./index.jsp?");*/
				} catch (SQLException e) {
					response.setContentType("text/plain");
					PrintWriter sair2 = response.getWriter();
				    sair2.print("NOTA Já ADICIONADA");
					//msg = String.format("Nota já inserida");
					//request.getSession().setAttribute("MENSAGEM", msg);
					e.printStackTrace();
					//response.sendRedirect("./index.jsp");
				}
			}
			catch( NumberFormatException e){
				
				response.setContentType("text/plain");
				PrintWriter sair3 = response.getWriter();
			    sair3.print("Isso Não é um Numero, eu sei");
			}
		}
}
