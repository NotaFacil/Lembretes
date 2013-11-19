<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="imagens/ico.png">

    <title>NotaFácil | NotaFácil</title>
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
			}
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
            <input type="button" onclick="validarCampos();" value="Entrar" class="btn btn-info"/>
          </form>
        </div>
      </div>
    </div>
    <div class="jumbotron">
      <br/>
      <div class="container">
      	<table>
      		<tr>
      			<td rowspan="2"><img src="imagens/ico.png"/></td>
      			<td><h1>NotaFácil</h1></td>
  			</tr>
      		<tr>
      			<td>
      				<p>Bem vindo ao <strong>NotaFácil</strong>. Aqui você realiza anotações de maneira fácil!</h3></p>
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