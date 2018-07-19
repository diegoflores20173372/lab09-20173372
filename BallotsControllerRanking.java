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
public class BallotsControllerRanking extends HttpServlet {
	public static int NRecibo = 1;

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		com.google.appengine.api.users.User cuentaGoogle = UserServiceFactory.getUserService().getCurrentUser();
		if (cuentaGoogle == null) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny1.jsp");
			dispatcher.forward(request, response);
		} else {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "select from " + model.entity.User.class.getName() + " where email=='"
					+ cuentaGoogle.getEmail() + "'" + "&& status==true";
			List<model.entity.User> uSearch = (List<model.entity.User>) pm.newQuery(query).execute();
			if (uSearch.isEmpty()) {
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/WEB-INF/Views/Errors/deny2.jsp");
				dispatcher.forward(request, response);
			} else {
				System.out.println(request.getServletPath());
				String query2 = "select from " + Resources.class.getName() + " where url=='" + request.getServletPath()
						+ "'" + " && status==true";
				List<Resources> rSearch = (List<Resources>) pm.newQuery(query2).execute();
				if (rSearch.isEmpty()) {
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/WEB-INF/Views/Errors/deny3.jsp");
					dispatcher.forward(request, response);
				} else {
					String query3 = "select from " + model.entity.Access.class.getName() + " where idRol=="
							+ uSearch.get(0).getIdRol() + "&& idUrl==" + rSearch.get(0).getId() + "&& status==true";
					List<model.entity.Access> aSearch = (List<model.entity.Access>) pm.newQuery(query3).execute();
					if (aSearch.isEmpty()) {
						RequestDispatcher dispatcher = getServletContext()
								.getRequestDispatcher("/WEB-INF/Views/Errors/deny4.jsp");
						dispatcher.forward(request, response);
					} else {
					
						
						String query4 = "select from " + Ballot.class.getName();
						List<Ballot> rank = (List<Ballot>) pm.newQuery(query4).execute();
						String query5 = "select from " + Producto.class.getName();
						List<Producto> orden = (List<Producto>) pm.newQuery(query5).execute();
						pm.close();
						ArrayList<Producto> nuevo= new ArrayList<Producto>(); 
						ArrayList<String> cadena = new ArrayList<String>(); 
                        for(int i=0;i< rank.size();i++){
                        	cadena.add(rank.get(i).getLlanta()+"R"+rank.get(i).getCantidad());   //-> 185/13R13R5
                        }
						for (int x = 0; x < cadena.size(); x++) {
							
							for (int i = 0; i < cadena.size() - x - 1; i++) {
								String llanta = cadena.get(i);
								String [] llantar = llanta.split("R");
								String llanta1 = cadena.get(i+1);
								String [] llantar1 = llanta1.split("R");
								if (Integer.parseInt(llantar1[2]) > Integer
										.parseInt(llantar[2])) {
									String aux = cadena.get(i + 1);
									String aux2 =cadena.get(i);
									cadena.set(i + 1, aux2);
									cadena.set(i, aux);
								}
								
							
								
							}
						}

						for (int j = 0; j < cadena.size(); j++) {
							for (int i = 0; i <orden.size() ; i++) {
								String llanta = cadena.get(j);
								String [] llantar = llanta.split("R");
								if(orden.get(i).getMedida().equals(llantar[0])&&orden.get(i).getAro().equals(llantar[1]) ){
									nuevo.add(orden.get(i));
								}
							}
						}
                          
						request.setAttribute("nuevo", nuevo);
						request.setAttribute("cantidad", cadena);
						RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Ballots/report.jsp");
						rd.forward(request, response);
					}
				}
			}
		}
	}
}