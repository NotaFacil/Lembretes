package com.db.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.bean.Usuario;
import com.db.connection.HibernateUtil;
import com.db.dao.UsuarioDao;

public class UsuarioDaoImpl implements UsuarioDao {

	private Session sessao;
	private Transaction transacao;

	public boolean salvar(Usuario usuario) {
		try {
			this.sessao = HibernateUtil.getSessionFactory().getCurrentSession();
			this.transacao = this.sessao.beginTransaction();
			this.sessao.save(usuario);
			this.transacao.commit();
			return true;
		} catch (HibernateException e) {
			System.out.println("Não foi possível inserir o usuario. Erro: " + e.getMessage());
			return false;
		} finally {
			try {
				if (this.sessao.isOpen()) {
					this.sessao.close();
				}
			} catch (Throwable e) {
				System.out.println("Erro ao fechar operação de inserção. Mensagem: " + e.getMessage());
			}
		}
	}

	public void atualizar(Usuario usuario) {
		try {
			this.sessao = HibernateUtil.getSessionFactory().getCurrentSession();
			this.transacao = this.sessao.beginTransaction();
			this.sessao.update(usuario);
			this.transacao.commit();
		} catch (HibernateException e) {
			System.out.println("Não foi possível alterar o usuario. Erro: " + e.getMessage());
		} finally {
			try {
				if (this.sessao.isOpen()) {
					this.sessao.close();
				}
			} catch (Throwable e) {
				System.out.println("Erro ao fechar operação de atualização. Mensagem: " + e.getMessage());
			}
		}
	}

	public void excluir(Usuario usuario) {
		try {
			this.sessao = HibernateUtil.getSessionFactory().getCurrentSession();
			this.transacao = this.sessao.beginTransaction();
			this.sessao.delete(usuario);
			this.transacao.commit();
		} catch (HibernateException e) {
			System.out.println("Não foi possível excluir o usuario. Erro: " + e.getMessage());
		} finally {
			try {
				if (this.sessao.isOpen()) {
					this.sessao.close();
				}
			} catch (Throwable e) {
				System.out.println("Erro ao fechar operação de exclusão. Mensagem: " + e.getMessage());
			}
		}
	}

	public Usuario buscarUsuario(Integer id) {
		Usuario usuario = null;

		try {
			this.sessao = HibernateUtil.getSessionFactory().getCurrentSession();
			this.transacao = this.sessao.beginTransaction();
			Criteria filtro = this.sessao.createCriteria(Usuario.class);
			filtro.add(Restrictions.eq("id", id));
			usuario = (Usuario) filtro.uniqueResult();
			this.transacao.commit();
		} catch (Throwable e) {
			if (this.transacao.isActive()) {
				this.transacao.rollback();
			}
		} finally {
			try {
				if (this.sessao.isOpen()) {
					this.sessao.close();
				}
			} catch (Throwable e) {
				System.out.println("Erro ao fechar operação de busca. Mensagem: " + e.getMessage());
			}
		}
		return usuario;
	}
	
	public List<Usuario> listar() {
		List<Usuario> usuarios = null;

		try {
			this.sessao = HibernateUtil.getSessionFactory().getCurrentSession();
			this.transacao = this.sessao.beginTransaction();
			Criteria filtro = this.sessao.createCriteria(Usuario.class);
			usuarios = filtro.list();
			this.transacao.commit();
		} catch (Throwable e) {
			if (this.transacao.isActive()) {
				this.transacao.rollback();
			}
		} finally {
			try {
				if (this.sessao.isOpen()) {
					this.sessao.close();
				}
			} catch (Throwable e) {
				System.out.println("Erro ao fechar operação de listagem. Mensagem: " + e.getMessage());
			}
		}
		return usuarios;
	}
	
	public Usuario logar(Usuario usuario){
		Usuario usuarioResultado = null;
		try {
			this.sessao = HibernateUtil.getSessionFactory().getCurrentSession();
			this.transacao = this.sessao.beginTransaction();
			Criteria filtro1 = this.sessao.createCriteria(Usuario.class);
			filtro1.add(Restrictions.eq("login", usuario.getLogin()));
			filtro1.add(Restrictions.eq("senha", usuario.getSenha()));
			usuarioResultado = (Usuario)filtro1.uniqueResult();
			if(usuarioResultado == null){
				Criteria filtro2 = this.sessao.createCriteria(Usuario.class);
				filtro2.add(Restrictions.eq("email", usuario.getEmail()));
				filtro2.add(Restrictions.eq("senha", usuario.getSenha()));
				usuarioResultado = (Usuario)filtro2.uniqueResult();
			}
			
			if(usuarioResultado != null && usuarioResultado.getUsuarioConfirmado() == 1){
				return usuarioResultado;	
			}else{
				return null;
			}
		} catch (Exception e) {
			System.out.println("erro ao logar: " + e.getMessage());
			if (this.transacao.isActive()) {
				this.transacao.rollback();
			}
			return null;
		} finally {
			try {
				if (this.sessao.isOpen()) {
					this.sessao.close();
				}
			} catch (Throwable e) {
				System.out.println("Erro ao fechar operação de logar. Mensagem: " + e.getMessage());
			}
		}
	}
}