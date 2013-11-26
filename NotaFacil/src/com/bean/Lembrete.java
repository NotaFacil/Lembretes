package com.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author Rafael
 *
 */
@Entity
@Table(name = "lembrete")
public class Lembrete implements Serializable{
	
	private static final long serialVersionUID = -7695012344951193407L;
	
	@Id
	@GeneratedValue
	@Column(name = "lem_id")
	private Integer id;
	
	@Column(name = "lem_dh_insercao", updatable = false)
	private Date dhCriacao;
	
	@Column(name = "lem_dh_inicio")
	private Date dhInicio;
	
	@Column(name = "lem_dh_fim")	
	private Date dhFim;

	@Column(name = "lem_dh_lembrar")	
	private Date dhLembrar;
	
	@Column(name = "lem_titulo")
	private String titulo;
	
	@Column(name = "lem_descricao")
	private String descricao;
	
	@Column(name = "lem_local")
	private String local;
	
	@ManyToOne
	@JoinColumn(name = "usu_id")
	private Usuario usuario;
	
	@Column(name = "lem_enviado")
	private Integer enviado;
	
	public Integer getEnviado() {
		return enviado;
	}
	public void setEnviado(Integer enviado) {
		this.enviado = enviado;
	}
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
	public Date getDhLembrar() {
		return dhLembrar;
	}
	public void setDhLembrar(Date dhLembrar) {
		this.dhLembrar = dhLembrar;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((descricao == null) ? 0 : descricao.hashCode());
		result = prime * result
				+ ((dhCriacao == null) ? 0 : dhCriacao.hashCode());
		result = prime * result + ((dhFim == null) ? 0 : dhFim.hashCode());
		result = prime * result
				+ ((dhInicio == null) ? 0 : dhInicio.hashCode());
		result = prime * result
				+ ((dhLembrar == null) ? 0 : dhLembrar.hashCode());
		result = prime * result + ((enviado == null) ? 0 : enviado.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((local == null) ? 0 : local.hashCode());
		result = prime * result + ((titulo == null) ? 0 : titulo.hashCode());
		result = prime * result + ((usuario == null) ? 0 : usuario.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Lembrete other = (Lembrete) obj;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (dhCriacao == null) {
			if (other.dhCriacao != null)
				return false;
		} else if (!dhCriacao.equals(other.dhCriacao))
			return false;
		if (dhFim == null) {
			if (other.dhFim != null)
				return false;
		} else if (!dhFim.equals(other.dhFim))
			return false;
		if (dhInicio == null) {
			if (other.dhInicio != null)
				return false;
		} else if (!dhInicio.equals(other.dhInicio))
			return false;
		if (dhLembrar == null) {
			if (other.dhLembrar != null)
				return false;
		} else if (!dhLembrar.equals(other.dhLembrar))
			return false;
		if (enviado == null) {
			if (other.enviado != null)
				return false;
		} else if (!enviado.equals(other.enviado))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (local == null) {
			if (other.local != null)
				return false;
		} else if (!local.equals(other.local))
			return false;
		if (titulo == null) {
			if (other.titulo != null)
				return false;
		} else if (!titulo.equals(other.titulo))
			return false;
		if (usuario == null) {
			if (other.usuario != null)
				return false;
		} else if (!usuario.equals(other.usuario))
			return false;
		return true;
	}
}