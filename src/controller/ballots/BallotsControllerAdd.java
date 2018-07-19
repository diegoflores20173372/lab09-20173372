package controller.ballots;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserServiceFactory;

import javax.jdo.PersistenceManager;
import model.entity.*;
@SuppressWarnings("serial")
public class BallotsControllerAdd extends HttpServlet{
	public static int NRecibo = 1;
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{	
		com.google.appengine.api.users.User cuentaGoogle = UserServiceFactory.getUserService().getCurrentUser();
		if(cuentaGoogle == null){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny1.jsp");
			dispatcher.forward(request, response);
		}
		else{
			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "select from " + model.entity.User.class.getName() + " where email=='" + cuentaGoogle.getEmail() + "'" + "&& status==true";
			List<model.entity.User> uSearch = (List<model.entity.User>) pm.newQuery(query).execute();
			if(uSearch.isEmpty()){
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny2.jsp");
				dispatcher.forward(request, response);
			}
			else{
				System.out.println(request.getServletPath());
				String query2 = "select from " + Resources.class.getName() + " where url=='" + request.getServletPath() + "'" + " && status==true";
				List<Resources> rSearch = (List<Resources>) pm.newQuery(query2).execute();
				if(rSearch.isEmpty()){
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny3.jsp");
					dispatcher.forward(request, response);
				}
				else{
					String query3 = "select from " + model.entity.Access.class.getName() + " where idRol==" + uSearch.get(0).getIdRol() +
							"&& idUrl==" + rSearch.get(0).getId() + "&& status==true";
					List<model.entity.Access> aSearch = (List<model.entity.Access>) pm.newQuery(query3).execute();
					if(aSearch.isEmpty()){
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny4.jsp");
						dispatcher.forward(request, response);
					}
					else{
						request.setAttribute("Nboleta", Integer.toString(NRecibo));
						query3 = "select from " + Producto.class.getName();
						List<Producto> prod = (List<Producto>) pm.newQuery(query3).execute();
						ArrayList<String> largo = new ArrayList<String>();
						ArrayList<String> ancho = new ArrayList<String>();
						ArrayList<String> aro = new ArrayList<String>();
						for(int i = 0; i < prod.size() ; i++){
							if(prod.get(i).isStock()){
								largo.add(prod.get(i).getMedida().substring(0, prod.get(i).getMedida().indexOf("/")));
								ancho.add(prod.get(i).getMedida().substring(prod.get(i).getMedida().indexOf("/")+1));
								aro.add(prod.get(i).getAro());
							}
						}
						for(int i = 0; i < largo.size(); i++){
							for(int j = 0; j <largo.size();j++){
								if(largo.get(i).equals(largo.get(j)) && i != j)
									largo.remove(j);
							}
						}
						for(int i = 0; i < ancho.size(); i++){
							for(int j = 0; j <ancho.size();j++){
								if(ancho.get(i).equals(ancho.get(j)) && i != j)
									ancho.remove(j);
							}
						}
						for(int i = 0; i < aro.size(); i++){
							for(int j = 0; j < aro.size();j++){
								if(aro.get(i).equals(aro.get(j)) && i != j)
									aro.remove(j);
							}
						}
						request.setAttribute("largo", largo);
						request.setAttribute("ancho", ancho);
						request.setAttribute("aro", aro);
						pm.close();
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Ballots/add.jsp");
						dispatcher.forward(request, response);
					}
				}
			}
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Ballot aux = new Ballot(
				request.getParameter("dni"),
				request.getParameter("direccion"),
				request.getParameter("distrito"),
				request.getParameter("telefono"),
				request.getParameter("Usuario"),
				Integer.toString(NRecibo),
				request.getParameter("cantidad"),
				request.getParameter("largo")+"/"+request.getParameter("ancho")+"R"+request.getParameter("aro"),
				request.getParameter("precioUnit"),
				Double.toString(Double.parseDouble(request.getParameter("precioUnit"))*Integer.parseInt(request.getParameter("cantidad"))));
		try{
			NRecibo++;
			pm.makePersistent(aux);
			pm.close();
			response.sendRedirect("/ballots");
		}	
		catch(Exception e){
			response.getWriter().println(e.getMessage());
		}
	}
}