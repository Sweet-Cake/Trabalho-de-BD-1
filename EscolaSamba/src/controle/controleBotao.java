package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class controleBotao
 */
@WebServlet("/controleBotao")
public class controleBotao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public controleBotao() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd=request.getParameter("cmd");
		switch(cmd.toLowerCase()){
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
