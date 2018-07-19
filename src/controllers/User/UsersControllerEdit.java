package controllers.User;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.UserServiceFactory;

import model.entity.*;

@SuppressWarnings("serial")
public class UsersControllerEdit extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
						User users = pm.getObjectById(User.class, Long.parseLong(req.getParameter("id")));
						req.setAttribute("users", users);
						String query4 = "SELECT FROM "+ Rol.class.getName();
						List<Rol> roles = (List<Rol>)pm.newQuery(query4).execute();
						req.setAttribute("roles", roles);
						pm.close();
						RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/User/editar.jsp");
						rd.forward(req, resp);
					}
				}
			}
		}
	}
	public void doPost(HttpServletRequest requi, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		User users = pm.getObjectById(User.class, Long.parseLong(requi.getParameter("id")));
		boolean status = Boolean.parseBoolean(requi.getParameter("estado"));
		boolean gender = Boolean.parseBoolean(requi.getParameter("gender"));
		Long miId = Long.parseLong(requi.getParameter("role"));
		users.setName(requi.getParameter("nombre"));
		users.setDNI(requi.getParameter("dni"));
		users.setDireccion(requi.getParameter("direccion"));
		users.setDistrito(requi.getParameter("distrito"));
		users.setTelefono(requi.getParameter("telefono"));
		users.setEmail(requi.getParameter("email"));
		users.setBirt(requi.getParameter("date"));
		users.setStatus(status);
		users.setGender(gender);
		users.setIdRol(miId);
		pm.close();
		resp.sendRedirect("/users/view?id="+requi.getParameter("id"));
	}
}