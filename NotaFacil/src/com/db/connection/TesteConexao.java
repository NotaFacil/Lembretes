package com.db.connection;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;

import com.bean.Usuario;
import com.db.dao.impl.UsuarioDaoImpl;

public class TesteConexao {
	
	public static void main(String[] args) {
		Session sessao = null;
		Transaction transacao = null;
		try {
			UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
			List<Usuario> usuarios = usuarioDao.listar();
			
			sessao = HibernateUtil.getSessionFactory().getCurrentSession();
			transacao = sessao.beginTransaction();
			System.out.println("Conectou!");
			
			Criteria filtro = sessao.createCriteria(Usuario.class);
			usuarios = filtro.list();
			transacao.commit();
			
			for (Usuario usuario : usuarios) {
				System.out.println(usuario.getLogin() + " " + usuario.getSenha());
			}
			
		} catch (Exception e) {
			System.out.println("Não conectou... " + e.getMessage());
		} finally{
			try {
				if (sessao.isOpen()) {
					sessao.close();
				}
			} catch (Throwable e) {
				System.out.println("Erro ao fechar operação de inserção. Mensagem: " + e.getMessage());
			}
		}
	}
}