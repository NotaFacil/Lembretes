package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Deslogar extends HttpServlet{

	private static final long serialVersionUID = -493348207125108261L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		request.getSession().invalidate();
		response.sendRedirect("index.jsp");
	}
}
