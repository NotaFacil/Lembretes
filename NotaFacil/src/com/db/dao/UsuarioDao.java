package com.db.dao;

import java.util.List;
import com.bean.Usuario;

public interface UsuarioDao{
	public void salvar(Usuario usuario);
	public void atualizar(Usuario usuario);
	public void excluir(Usuario usuario);
	public List<Usuario> listar();
	public Usuario buscarUsuario(Integer id);
	public Usuario logar(Usuario usuario);
}