package email;

import java.util.HashMap;
import java.util.Map;


public class Email {
	
	public Email(){
		super();
	}
	
	public void enviarEmail(Lembrete lembrete) {
			
		String host = "smtp.gmail.com";
        String port = "587";
        String mailFrom = "notafacil.lembretes@gmail.com";
        String password = "N074F4C1L";
 
        String mailTo = lembrete.getUsuario().getEmail();
        String subject = "Lembrete NotaFacil";
        StringBuffer body = new StringBuffer("<html>");
        body.append("<head><meta name='viewport' content='width=device-width, initial-scale=1.0'> <meta name='description' content=''> <meta charset='UTF-8'> </head>");
        body.append("<body>");
        body.append("<center>");
        body.append("<a href='www.google.com.br'>");
        body.append("<img src=\"cid:header\" />");
        body.append("</a>");
        body.append("<div style='width:881px; background-color:#FFFFFF'> ");
        body.append(generateTable(lembrete));
		body.append("<br/></div>");
        body.append("<img src=\"cid:footer\" />");
        body.append("</center>");
        body.append("</body>");
        body.append("</html>");
 
        Map<String, String> inlineImages = new HashMap<String, String>();
        inlineImages.put("header", "F:\\ProjetoPABDI\\Email\\header1.PNG");
        inlineImages.put("footer", "F:\\ProjetoPABDI\\Email\\footer1.PNG");
 
        try {
        	System.out.println("Enviando Email...");
            EmbeddedImageEmailUtil.send(host, port, mailFrom, password, mailTo, subject, body.toString(), inlineImages);
            System.out.println("Email Enviado.");
        } catch (Exception ex) {
            System.out.println("Falha ao enviar email.");
            ex.printStackTrace();
        }
	}
	
	private String generateTable(Lembrete lembrete){
		String table = "" +
			"<table>" +
				"<th> <h3>" + getFirstName(lembrete.getUsuario().getNome()) + ", Seu Lembrete! </h3></th>" +
				"<tr border-top-style: solid>" +
					"<td>" +
						"<b  align='left'>Titulo:&nbsp; </b>" + lembrete.getTitulo() +
					"</td>" +
				"</tr>" +
				"<tr>" +
					"<td>" +
						"<b  align='left'>Descrição:&nbsp; </b>" + lembrete.getDescricao() +
					"</td>" +
				"</tr>" +
				"<tr>" +
					"<td>" +
						"<b align='left'>Local:&nbsp; </b>" + lembrete.getLocal() +
					"</td>" +
				"</tr>" +
				"<tr>" +
					"<td>" +
						"<b align='left'>Data Inicial:&nbsp; </b>15/11/2013 15:03:00" + //lembrete.getDhInicio() +
					"</td>" +
				"</tr>" +
				"<tr>" +
					"<td>" +
						"<b align='left'>Data Final:&nbsp; </b>15/12/2013 15:03:00" + //lembrete.getDhFim() +
					"</td>" +
				"</tr>" +	
			"</table>";
		return table;
	}
	
	private String getFirstName(String name){
		String[] nome = name.split(" ");
		return nome[0];
	}
}
