package com.db.dao;

import java.util.List;

import com.bean.Lembrete;
import com.bean.Usuario;

public interface LembreteDao {
	public void salvar(Lembrete lembrete);
	public void atualizar(Lembrete lembrete);
	public void excluir(Lembrete lembrete);
	public List<Lembrete> listar();
	public Lembrete buscarLembrete(Integer id);
	public List<Lembrete> buscarLembretesPorUsuario(Usuario usuario);
}
