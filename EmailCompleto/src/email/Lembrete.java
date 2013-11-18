package email;

import java.io.Serializable;
import java.util.Date;

public class Lembrete implements Serializable{
	
	private static final long serialVersionUID = -7695012344951193407L;
	
	private Integer id;
	
	private Date dhCriacao;
	
	private Date dhInicio;
	
	private Date dhFim;
	
	private String titulo;
	
	private String descricao;
	
	private String local;
	
	private Usuario usuario;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getDhCriacao() {
		return dhCriacao;
	}
	public void setDhCriacao(Date dhCriacao) {
		this.dhCriacao = dhCriacao;
	}
	public Date getDhInicio() {
		return dhInicio;
	}
	public void setDhInicio(Date dhInicio) {
		this.dhInicio = dhInicio;
	}
	public Date getDhFim() {
		return dhFim;
	}
	public void setDhFim(Date dhFim) {
		this.dhFim = dhFim;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}
