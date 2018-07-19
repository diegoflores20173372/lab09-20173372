//listado productos
package controllers.Productos;
import java.util.*;
import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.PMF;
import model.entity.Producto;

@SuppressWarnings("serial")
public class ProductosControllerIndex extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String query4 = "SELECT FROM "+ Producto.class.getName();
		List<Producto> producto = (List<Producto>)pm.newQuery(query4).execute();
		pm.close();
		req.setAttribute("producto", producto);
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Productos/index.jsp");
		rd.forward(req, resp);
	}
}
