package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Lembrete;
import com.bean.Usuario;
import com.db.dao.impl.LembreteDaoImpl;
import com.db.dao.impl.UsuarioDaoImpl;

public class Logar extends HttpServlet{

	private static final long serialVersionUID = 2429521962227578998L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		Usuario usuario = new Usuario();
		UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
		
		usuario.setLogin(request.getParameter("usuario"));
		usuario.setEmail(request.getParameter("usuario"));
		usuario.setSenha(request.getParameter("senha"));
		Usuario usuarioResultado = usuarioDao.logar(usuario);
		
		HttpSession sessao = request.getSession();
		if(usuarioResultado != null){
			sessao.setAttribute("usuarioId", usuarioResultado.getId());
			sessao.setAttribute("usuarioNome", usuarioResultado.getNome());
			
			LembreteDaoImpl lembreteDao = new LembreteDaoImpl();
			List<Lembrete> listaLembretes = new ArrayList<Lembrete>(); 
			listaLembretes = lembreteDao.buscarLembretesPorUsuario(usuarioResultado);
			
			sessao.setAttribute("listaLembretes", listaLembretes);
			
			response.sendRedirect("principal.jsp");
		}else{
			sessao.setAttribute("usuarioNome", "inv�lido");
			response.sendRedirect("index.jsp");
		}
	}
}