package com.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Usuario;
import com.db.dao.impl.UsuarioDaoImpl;
import com.email.Email;

public class ConfirmarCadastro extends HttpServlet{

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
		List<Usuario> usuarios = new LinkedList<Usuario>();
		
		String emailRecebido = request.getParameter("confirmar");
		usuarios = usuarioDao.listar();
		
		HttpSession sessao = request.getSession();
		for(Object i : usuarios){
			Usuario u = (Usuario) i;
			if(Email.criptografar(u.getEmail()).equals(emailRecebido)){
				u.setUsuarioConfirmado(1);
				usuarioDao.atualizar(u);
				
				sessao.setAttribute("usuarioNome", "confirmado");
				response.sendRedirect("index.jsp");
				break;
			}
		}
	}

}

