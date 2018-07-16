package controllers.Productos;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserServiceFactory;

import model.entity.*;
import java.util.*;
@SuppressWarnings("serial")
public class ProductosControllerAdd extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		com.google.appengine.api.users.User cuentaGoogle = UserServiceFactory.getUserService().getCurrentUser();
		if(cuentaGoogle == null){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny1.jsp");
			dispatcher.forward(req, resp);
		}
		else{
			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "select from " + model.entity.User.class.getName() + " where email=='" + cuentaGoogle.getEmail() + "'" + "&& status==true";
			List<model.entity.User> uSearch = (List<model.entity.User>) pm.newQuery(query).execute();
			if(uSearch.isEmpty()){
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny2.jsp");
				dispatcher.forward(req, resp);
			}
			else{
				System.out.println(req.getServletPath());
				String query2 = "select from " + Resources.class.getName() + " where url=='" + req.getServletPath() + "'" + " && status==true";
				List<Resources> rSearch = (List<Resources>) pm.newQuery(query2).execute();
				if(rSearch.isEmpty()){
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny3.jsp");
					dispatcher.forward(req, resp);
				}
				else{
					String query3 = "select from " + model.entity.Access.class.getName() + " where idRol==" + uSearch.get(0).getIdRol() +
							"&& idUrl==" + rSearch.get(0).getId() + "&& status==true";
					List<model.entity.Access> aSearch = (List<model.entity.Access>) pm.newQuery(query3).execute();
					if(aSearch.isEmpty()){
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny4.jsp");
						dispatcher.forward(req, resp);
					}
					else{
						RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Productos/add.jsp");
						rd.forward(req, resp);
					}
				}
			}
		}
	}
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest requ, HttpServletResponse respon) throws IOException, ServletException {
		PersistenceManager pm= PMF.get().getPersistenceManager();
		String query = "SELECT FROM "+ Producto.class.getName();
		int cont=0;
		List<Producto> producto = (List<Producto>)pm.newQuery(query).execute();
		try{
			for (Producto us: producto){
				if(us.getMarca().equals(requ.getParameter("marca"))&&us.getModelo().equals(requ.getParameter("modelo"))&&us.getAro().equals(
						requ.getParameter("aro"))&&us.getMedida().equals(requ.getParameter("medida"))
						&&us.getPrecio().equals(requ.getParameter("precio"))){
					cont++;
					RequestDispatcher rd=this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Productos/copiado.jsp");
					rd.forward(requ, respon);
				}		
			}
			if(cont==0){	
				Producto  prod= new Producto(requ.getParameter("modelo"), requ.getParameter("marca"),requ.getParameter("medida"),requ.getParameter("precio"),requ.getParameter("aro"));
				pm.makePersistent(prod);
				pm.close();
				respon.sendRedirect("/productos");

			}
		}catch(Exception e){
			respon.getWriter().println(e.getMessage());
		}
	}
}
