package email;

import java.util.Date;

public class Main {

	public static void main(String[] args) {
		Email email = new Email();
		
		Usuario usuario = new Usuario();
		usuario.setEmail("osmar_salles@hotmail.com");
		usuario.setId(0);
		usuario.setLogin("OsmarSalles");
		usuario.setNome("Osmar Salles de Carvalho");
		usuario.setSenha("1503");		
		
		Lembrete lembrete = new Lembrete();
		lembrete.setTitulo("Desenvolvimento");
		lembrete.setLocal("SSLTI LTDA");
		lembrete.setDescricao("Criação de Dispositivo de Tranca");
		lembrete.setId(0);
		lembrete.setUsuario(usuario);
		
		email.enviarEmail(lembrete);
	}
}
