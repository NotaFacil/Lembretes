package com.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Lembrete;
import com.bean.Usuario;
import com.db.dao.impl.LembreteDaoImpl;
import com.db.dao.impl.UsuarioDaoImpl;

public class Alterar extends HttpServlet{

	private static final long serialVersionUID = -3999262653245899300L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		Lembrete lembrete = new Lembrete();
		LembreteDaoImpl lembreteDao = new LembreteDaoImpl();
		DateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		
		Usuario usuario = new Usuario();
		UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
		
		usuario = usuarioDao.buscarUsuario((Integer) request.getSession().getAttribute("usuarioId"));
		
		try{
			lembrete.setId(Integer.parseInt(request.getParameter("idLembrete")));
			lembrete.setDhCriacao(format.parse(request.getParameter("dhCriacao")));
			lembrete.setTitulo((String) request.getParameter("titulo"));
			lembrete.setDescricao((String) request.getParameter("descricao"));
			lembrete.setLocal((String) request.getParameter("local"));
			lembrete.setDhInicio(format.parse(request.getParameter("dhInicio")));
			lembrete.setDhFim(format.parse(request.getParameter("dhFim")));
			lembrete.setDhLembrar(format.parse(request.getParameter("dhLembrar")));
			lembrete.setUsuario(usuario);
		}catch(ParseException e){
			System.out.println("Erro ao realizar cast de data: " + e.getMessage());
		}
		
		lembreteDao.atualizar(lembrete);
		
		List<Lembrete> listaLembretes = new ArrayList<Lembrete>();
		listaLembretes = lembreteDao.buscarLembretesPorUsuario(usuario);
		request.getSession().setAttribute("listaLembretes", listaLembretes);
		
		response.sendRedirect("principal.jsp");
	}
}