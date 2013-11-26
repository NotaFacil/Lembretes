<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="shortcut icon" href="imagens/ico.png">

		<title>NotaFácil | Configurações</title>

		<!--<link href="./util/css/bootstrap-3.0.css" rel="stylesheet" media="screen"> -->
		<link href="http://getbootstrap.com/dist/css/bootstrap.css" rel="stylesheet" media="screen">

		<link href="./util/css/bootstrap-datetimepicker.css" rel="stylesheet" media="screen">

		<!-- Script para validação de sessão -->
		<script type="text/javascript">
			 window.onload = function(){
				var nome = "<%=request.getSession().getAttribute("usuarioNome")%>";
				if(nome == "null"){
					window.location = "index.jsp";
					return;
				}
			}
    	</script>
		<!-- Fim script para validação de sessão -->
		
	</head>
	<body>
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="index.jsp">NotaFácil</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a>Bem vindo ${sessionScope.usuarioNome}!</a></li>
					</ul>

					<form name="deslogar" method="POST" action="deslogar.do" class="navbar-form navbar-right">
						<a href="principal.jsp"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-cog"></span> Lembretes</button></a>
						<button type="button" onclick="submit();" class="btn btn-info"><span class="glyphicon glyphicon-log-out"></span> Sair</button>
					</form>
				</div>
			</div>
		</div>
		<div class="jumbotron">
			<br />
			<div class="container">
				<table>
					<tr>
						<td rowspan="2"><img src="imagens/ico.png" height="75" width="75" /></td>
						<td><h1><span style="padding-left:40px">Configurações</span></h1></td>
					</tr>
					<tr>
      					<td><p style="padding-left: 60px; ">Configurações do ${sessionScope.usuarioNome}</h3></p></td>
      				</tr>
				</table>
				<br />
				
				<div class="input-group input-group-sm">
					<span class="input-group-addon">Nome:</span>
					<input name="nome" maxlength="100" type="text" class="form-control input-sm" placeholder="Nome">
				</div>
				

			</div>
		</div>
		<div align="center" class="container">
			<footer>
				<p> &copy; Desenvolvido por
					<strong><a href="mailto:osmar_salles@hotmail.com">Osmar Salles</a></strong>, 
					<strong><a href="mailto:rafaelgustavob@hotmail.com">Rafael Bezerra</a></strong>,
					<strong><a href="mailto:thamyy.campos@hotmail.com">Thamyris Campos</a></strong> 2013
				</p>
			</footer>
		</div>
		<div id="mascara"></div>

		<script type="text/javascript" src="./util/js/jquery-1.9.1.js" charset="UTF-8"></script>
		<script type="text/javascript" src="./util/js/bootstrap.js" charset="UTF-8"></script>
		<script type="text/javascript" src="./util/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>

		<!-- Script de configuração do date picker -->
		<script type="text/javascript">
			$('.form_datetime').datetimepicker({
				language: 'brazil',
				weekStart: 1,
				todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				forceParse: 0,
				showMeridian: 0
			});
		</script>
		<!-- Fim script de configuração do date picker -->

		<!-- Script de mascara de data e hora -->
		<script type="text/javascript">
			jQuery(function($){
				$("#dh").mask("99/99/9999 99:99");
			});
		</script>
		<!-- Fim script de mascara de data e hora -->
	</body>
</html>