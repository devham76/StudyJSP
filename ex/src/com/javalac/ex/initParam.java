package com.javalac.ex;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class initParam
 */
@WebServlet(urlPatterns= {"/initP"}, initParams= {@WebInitParam(name="id",value="hyemiId"), @WebInitParam(name="pw", value="1234")})
public class initParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public initParam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String ID = getInitParameter("id");
		String PW = getInitParameter("pw");
		System.out.println("id :"+ID);
		System.out.println("id :"+PW);
		
		String NAME = getServletContext().getInitParameter("name");
		System.out.println("name :"+NAME);
		
		System.out.println("do get !");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
