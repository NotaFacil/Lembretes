package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Lembrete;
import com.db.dao.impl.LembreteDaoImpl;
import com.db.dao.impl.UsuarioDaoImpl;

public class Excluir extends HttpServlet{

	private static final long serialVersionUID = -1115804279495209644L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		Lembrete lembrete = new Lembrete();
		LembreteDaoImpl lembreteDao = new LembreteDaoImpl();
		
		lembrete.setId(Integer.parseInt(request.getParameter("idLembrete")));

		lembreteDao.excluir(lembrete);
		
		List<Lembrete> listaLembretes = new ArrayList<Lembrete>();
		listaLembretes = lembreteDao.buscarLembretesPorUsuario(new UsuarioDaoImpl().buscarUsuario((Integer) request.getSession().getAttribute("usuarioId")));
		request.getSession().setAttribute("listaLembretes", listaLembretes);
		
		response.sendRedirect("principal.jsp");
	}
}