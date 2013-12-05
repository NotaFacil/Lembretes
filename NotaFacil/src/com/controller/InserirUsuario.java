package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Usuario;
import com.db.dao.impl.UsuarioDaoImpl;
import com.email.Email;

public class InserirUsuario extends HttpServlet{

	private static final long serialVersionUID = -7896800627800309575L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		Usuario usuario = new Usuario();
		UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
		
		usuario.setNome((String) request.getParameter("nome"));
		usuario.setEmail((String) request.getParameter("email"));
		usuario.setCelular((String) request.getParameter("celular"));
		usuario.setLogin((String) request.getParameter("login"));
		usuario.setSenha((String) request.getParameter("senha"));
		
		HttpSession sessao = request.getSession();
		if(usuarioDao.salvar(usuario)){
			Email email = new Email();
			email.enviarConfirmação(usuario);
			
			sessao.setAttribute("usuarioNome", "cadastrado");
			response.sendRedirect("index.jsp");
		}else{
			sessao.setAttribute("usuarioNome", "existente");
			response.sendRedirect("index.jsp");
		}
	}
	
}
