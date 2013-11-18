package email;

import java.io.Serializable;
import java.util.List;

public class Usuario implements Serializable {
	
	private static final long serialVersionUID = -9124348208221712979L;
	
	private Integer id;
	private String nome;
	private String email;
	private String login;
	private String senha;
	private List<Lembrete> lembretes;
	
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
}
