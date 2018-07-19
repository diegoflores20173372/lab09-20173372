package controllers.User;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import javax.servlet.http.*;

@SuppressWarnings("serial")
public class UsersControllerLogin extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserService us= UserServiceFactory.getUserService();
		User user= us.getCurrentUser(); // este users es de app engine
		if(user==null){
			resp.sendRedirect(us.createLoginURL(req.getRequestURI()));
		}else {
			req.setAttribute("user", user);
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/User/login.jsp");
			rd.forward(req, resp);
		}
	}
}
