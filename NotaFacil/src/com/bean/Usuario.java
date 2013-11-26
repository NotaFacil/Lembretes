package com.bean;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {
	
	private static final long serialVersionUID = -9124348208221712979L;
	
	@Id
	@GeneratedValue
	@Column(name = "usu_id")
	private Integer id;
	
	@Column(name = "usu_nome")
	private String nome;
	
	@Column(name = "usu_email")
	private String email;
	
	@Column(name = "usu_celular")
	private String celular;
	
	@Column(name = "usu_login")
	private String login;
	
	@Column(name = "usu_senha")
	private String senha;
	
	@OneToMany(mappedBy = "usuario")
	private List<Lembrete> lembretes;
	
	@Column(name = "usu_confirmado")
	private int usuarioConfirmado;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public List<Lembrete> getLembretes() {
		return lembretes;
	}
	public void setLembretes(List<Lembrete> lembretes) {
		this.lembretes = lembretes;
	}
	public String getCelular() {
		return celular;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getUsuarioConfirmado() {
		return usuarioConfirmado;
	}
	public void setUsuarioConfirmado(int usuarioConfirmado) {
		this.usuarioConfirmado = usuarioConfirmado;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((celular == null) ? 0 : celular.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((lembretes == null) ? 0 : lembretes.hashCode());
		result = prime * result + ((login == null) ? 0 : login.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + ((senha == null) ? 0 : senha.hashCode());
		result = prime * result + usuarioConfirmado;
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
		Usuario other = (Usuario) obj;
		if (celular == null) {
			if (other.celular != null)
				return false;
		} else if (!celular.equals(other.celular))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (lembretes == null) {
			if (other.lembretes != null)
				return false;
		} else if (!lembretes.equals(other.lembretes))
			return false;
		if (login == null) {
			if (other.login != null)
				return false;
		} else if (!login.equals(other.login))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (senha == null) {
			if (other.senha != null)
				return false;
		} else if (!senha.equals(other.senha))
			return false;
		if (usuarioConfirmado != other.usuarioConfirmado)
			return false;
		return true;
	}	
}