<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="imagens/ico.png">
    
    <title>NotaFácil | NotaFácil lembra você</title>
    <link href="http://getbootstrap.com/dist/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript">
    	function validarCampos(){
    		if(document.login.usuario.value == "" || document.login.senha.value == ""){
    			alert("Usuário e/ou senha vazio(s)! Preencha os campos.");
    		}else{
    			login.submit();
    		}
    	}
    	
    	window.onload = function(){
    		var nome = "<%=request.getSession().getAttribute("usuarioNome")%>";
    		if(nome == "inválido"){
   			 	alert("Login e/ou senha inválido(s)!");
   			 	<% request.getSession().invalidate(); %>;
   			 	return;
			}
    		
    		if(nome == "existente"){
    			alert("Email e/ou Login já existente(s)!");
   			 	<% request.getSession().invalidate(); %>;
   			 	return;
    		}
    		
    		if(nome == "cadastrado"){
    			alert("Confirme seu cadastro, através do email enviado para você.");
   			 	<% request.getSession().invalidate(); %>;
   			 	return;
    		}
		}
    	
    	function validarCamposCadastro(){
    		var nome = sign.nome.value; 
    		var email = sign.email.value;
    		var celular = sign.celular.value;
    		var login = sign.login.value;
    		var senha = sign.senha.value; 
    		var rep_senha = sign.conf_senha.value;   
    		if (nome == "") { 
    			 alert("Preencher campo Nome");
    			 sign.nome.focus();
    			 return;
    		}if(email == ""){
    			alert("Preencher campo Email");
    			sign.email.focus();
   			 	return;
    		}if(celular == ""){
    			alert("Informar Número do celular");
    			sign.celular.focus();
   			 	return;    			
    		}if(login == ""){
    			alert("Preencher campo Login");
    			sign.login.focus();
   			 	return;    			
    		}if(senha == ""){
    			alert("Preencher campo Senha");
    			sign.senha.focus();
   			 	return;
    		}if(rep_senha == ""){
    			alert("Preencher campo Repetir Senha");
    			sign.rep_senha.focus();
   			 	return;
    		}if(senha != rep_senha){
    			alert("Senha e Confirmar Senha não são iguais");
    			sign.senha.value = "";
    			sign.conf_senha.value = "";
    			sign.senha.focus();
   			 	return;
    		}
    		sign.submit();
    	}
    	    	
  	</script>
  </head>
  <body>
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="index.jsp">NotaFácil</a>
        </div>
        <div class="navbar-collapse collapse">
          <form name="login" method="POST" action="logar.do" class="navbar-form navbar-right">
            <div class="form-group">
              <input name="usuario" type="text" placeholder="E-mail ou login" class="form-control">
            </div>
            <div class="form-group">
              <input name="senha" type="password" placeholder="Senha" class="form-control">
            </div>
            <button type="button" onclick="validarCampos();" class="btn btn-info"><span class="glyphicon glyphicon-log-in"></span> Entrar</button>
          </form>
        </div>
      </div>
    </div>
    <div class="jumbotron">
      <br/>
      <div class="container">
      	<table>
      		<tr>
      			<td rowspan="3"><img src="imagens/ico.png"/></td>
      			<td><br/><br/><h1>NotaFácil</h1><h3><strong>NotaFácil</strong> lembra você.</h3></td>
				<td rowspan="2">
					<div class="navbar-collapse collapse" >
					      <form name="sign" method="POST" action="cadastrar.do" class="navbar-form navbar-right">
					        <div class="form-group" style="padding: 3px;">
					          <input name="nome" type="text" placeholder="Nome" class="form-control">
					        </div><br/>
					        <div class="form-group" style="padding: 3px;">
					          <input name="email" type="text" placeholder="email" class="form-control" >
					        </div><br/>
					        <div class="form-group" style="padding: 3px;">
					          <input name="celular" type="text" placeholder="celular" class="form-control celular" >
					        </div><br/>
					        <div class="form-group" style="padding: 3px;">
					          <input name="login" type="text" placeholder="login" class="form-control">
					        </div><br/>
					        <div class="form-group" style="padding: 3px;">
					          <input name="senha" type="password" placeholder="senha" class="form-control">
					        </div><br/>
					        <div class="form-group" style="padding: 3px;">
					          <input name="conf_senha" type="password" placeholder="Confirmar Senha" class="form-control">
					        </div><br/>
					        <div class="form-group" style="padding: 3px; ">
					        	<button type="button" onclick="validarCamposCadastro();" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> Sign in</button>
					        </div>
					      </form>
					    </div>
				</td>      			
  			</tr>
      		<tr>
      			<td><h3> </td>
      		</tr>
      		<tr>
	      		<td>
	      			<p style="text-align: center; ">Bem vindo ao <strong>NotaFácil</strong>. Aqui você realiza anotações de maneira fácil!</h3></p>
	      		</td>
      		</tr>
      		
   	  	</table>
      </div>
	  
	  
    </div>
    <div align="center" class="container">
      <footer>
        <p>&copy; Desenvolvido por <strong><a href="mailto:osmar_salles@hotmail.com">Osmar Salles</a></strong>, <strong><a href="mailto:rafaelgustavob@hotmail.com">Rafael Bezerra</a></strong>, <strong><a href="mailto:thamyy.campos@hotmail.com">Thamyris Campos</a></strong> 2013</p>
      </footer>
    </div>
  </body>
</html>