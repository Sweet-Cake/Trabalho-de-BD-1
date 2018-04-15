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
		response.setContentType("text/plain");
		String quesito=request.getParameter("quesito");
		PrintWriter out=response.getWriter();
		out.print("hello"+ quesito);
		request.getSession().setAttribute("MESSAGE", quesito);
		String cmd = request.getParameter("cmd");
		Inserir inserir=new Inserir();
		String msg;
		/*if("INSERIR".equalsIgnoreCase(cmd)) {
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
				response.sendRedirect("./index.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("verQuesito".equalsIgnoreCase("cmd")){
			Inserir in= new Inserir();
			try {
				List<NotaQuesito> listaQuesito =in.pesquisaQuesito(request.getParameter("quesito"));
				request.setAttribute("LISTA_QUESITO", listaQuesito);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			System.out.println("Ur a fool!");
			response.sendRedirect("./notas.jsp");
		}
		//RequestDispatcher rd = request.getRequestDispatcher("./index.jsp");
		//rd.forward(request, response);
		*/
		switch(cmd.toLowerCase()){
		case "inserir":
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
					msg = String.format("Nota para a escola %s inserida com sucesso!", es.nome);
					request.getSession().setAttribute("MENSAGEM", msg);
					response.sendRedirect("./index.jsp");
				} catch (SQLException e) {
					msg = String.format("Nota j� inserida");
					request.getSession().setAttribute("MENSAGEM", msg);
					e.printStackTrace();
					response.sendRedirect("./index.jsp");
				}
			}
			catch( NumberFormatException e){
				
				msg = String.format("Valor inv�lido");
				request.getSession().setAttribute("MENSAGEM", msg);
				e.printStackTrace();
				response.sendRedirect("./index.jsp");
			}
			break;
		case "verquesitos":
			System.out.println(":3");
			response.sendRedirect("./notas.jsp");
			break;
		case "mostrar":
			request.getSession().setAttribute("QUESITO", request.getParameter("Quesito"));
			//request.getSession().setAttribute("NOME", request.getParameter("Quesito"));
			response.sendRedirect("./notas.jsp");
			break;
		case "voltar":
			response.sendRedirect("./index.jsp");
			break;
		default:
			System.out.println("Ur a fool!");
			response.sendRedirect("./index.jsp");
			break;
		}
	}

}
