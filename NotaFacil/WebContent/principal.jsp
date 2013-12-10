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

		<title>NotaFácil | Principal</title>

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
	    	function validarCamposCadastro(form){
	    		var titulo = form.titulo.value;
	    		var descricao = form.descricao.value;
	    		var local = form.local.value;
	    		var dhInicio = form.dhInicio.value;
	    		var dhFim = form.dhFim.value;
	    		var dhLembrar = form.dhLembrar.value;
	    		   
	    		if (titulo == "") { 
	    			 sign.titulo.focus();
	    			 return;
	    		}if(descricao == ""){
	    			sign.descricao.focus();
	   			 	return;
	    		}if(local == ""){
	    			sign.local.focus();
	   			 	return;    			
	    		}if(dhInicio == ""){
	    			sign.dhInicio.focus();
	   			 	return;    			
	    		}if(dhFim == ""){
	    			sign.dhFim.focus();
	   			 	return;
	    		}if(dhLembrar == ""){
	    			sign.dhLembrar.focus();
	   			 	return;
	    		}
	    		form.submit();
	    	}
    	</script>
		<!-- Fim script para validação de sessão -->

		<!-- Script e estilo janela modal -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("a[rel=modal]").click( function(ev){
					ev.preventDefault();
					var id = $(this).attr("href");
					var alturaTela = $(document).height();
					var larguraTela = $(window).width();
					$('#mascara').css({'width':larguraTela,'height':alturaTela});
					$('#mascara').fadeIn(1000);	
					$('#mascara').fadeTo("slow",0.8);
					var left = ($(window).width() /2) - ( $(id).width() / 2 );
					var top = ($(window).height() / 2) - ( $(id).height() / 2 );
					$(id).css({'top':top,'left':left});
					$(id).show();
					$($(this).attr("x")).hide();
				});
				$("#mascara").click( function(){
					$(this).hide();
 					$(".window").hide();
 				});
 				$('.fechar').click(function(ev){
 					ev.preventDefault();
 					$("#mascara").hide();
 					$(".window").hide();
 				});
			});
		</script>
		<style type="text/css">
			#mascara {
				position: absolute;
				left: 0;
				top: 0;
				z-index: 9000;
				background-color: #000;
				display: none;
			}

			.window {
				display: none;
				width: 500px;
				position: absolute;
				left: 0;
				top: 0;
				background: #FFF;
				z-index: 9900;
				padding: 10px;
				border-radius: 10px;
			}

			.fechar {
				display: block;
				text-align: right;
			}
		</style>
		<!-- Fim script e estilo janela modal -->

		<!-- Script para definição de estilo textarea -->
		<style type="text/css">
			textarea {
				resize: none;
				display: block;
				width: 100%;
				height: auto;
				padding: 6px 12px;
				font-size: 14px;
				line-height: 1.428571429;
				color: #555555;
				vertical-align: middle;
				background-color: #ffffff;
				border: 1px solid #cccccc;
				border-radius: 4px;
				-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
				box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
				-webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
				transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
			}

			textarea:focus {
				border-color: #66afe9;
				outline: 0;
				-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
				box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
			}

			textarea[disabled],textarea[readonly],fieldset[disabled] textarea {
				cursor: not-allowed;
				background-color: #eeeeee;
			}
			
			textarea:-moz-placeholder {
				color: #999999;
			}
			
			textarea::-moz-placeholder {
				color: #999999;
			}
			
			textarea:-ms-input-placeholder {
				color: #999999;
			}
			
			textarea::-webkit-input-placeholder {
				color: #999999;
			}
		</style>
		<!-- Fim script para definição de estilo textarea -->

		<!-- Script para definição do estilo Read only -->
		<style type="text/css">
			.form-control[disabled],.form-control[readonly],fieldset[disabled] .form-control {
				cursor: default;
				background-color: #eeeeee;
			}
		</style>
		<!-- Fim script para definição do estilo Read only -->
		
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
<!-- 						<a href="configuracoes.jsp"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-cog"></span> Configurações</button></a> -->
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
						<td><img src="imagens/ico.png" height="75" width="75" /></td>
						<td><h1><span style="padding-left:40px">Lembretes</span></h1></td>
						<td>
							<span style="padding-left:40px">
								<a class="btn btn-info btn-lg" href="#janelaNovo" rel="modal">
	  								<span class="glyphicon glyphicon-plus"></span> Novo!
								</a>
							</span>
						</td>
					</tr>
				</table>
				<div class="row">
					<div class="window" id="janelaNovo">
<!-- 						<form accept-charset="ISO-8859-1" name="frmInserir" onSubmit="return validarCamposCadastro(this);" method="POST" action="inserir.do"> -->
						<form accept-charset="ISO-8859-1" name="frmInserir" method="POST" action="inserir.do">
							<div class="panel panel-default">
								<div class="panel-body">
									<h2>
										<strong>Inserir</strong>
									</h2>
									<hr />
									<div class="input-group input-group-lg">
										<span class="input-group-addon">Título</span> <input name="titulo" maxlength="50" type="text" class="form-control input-lg" placeholder="Título">
									</div>
									<br />
									<ul class="list-group">
										<li class="list-group-item">
											<div class="input-group input-group-sm">
												<span class="input-group-addon">Descrição</span>
												<textarea name="descricao" maxlength="300" class="input-sm" rows="6" placeholder="Descrição"></textarea>
											</div>
										</li>
										<li class="list-group-item">
											<div class="input-group input-group-sm">
												<span class="input-group-addon">Local</span>
												<input name="local" maxlength="100" type="text" class="form-control input-sm" placeholder="Local">
											</div>
										</li>
										<li class="list-group-item">
											<div class="input-group date form_datetime" data-date="${dataHora}" data-date-format="dd/mm/yyyy hh:ii" data-link-field="dtp_input1">
												<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
												<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
												<input name="dhInicio" type="text" ReadOnly="True" class="form-control" id="dh" placeholder="Início">
											</div>
										</li>
										<li class="list-group-item">
											<div class="input-group date form_datetime" data-date="${dataHora}" data-date-format="dd/mm/yyyy hh:ii" data-link-field="dtp_input1">
												<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
												<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
												<input name="dhFim" type="text" ReadOnly="True" class="form-control" id="dh" placeholder="Fim">
											</div>
										</li>
										<li class="list-group-item">
											<div class="input-group date form_datetime" data-date="${dataHora}" data-date-format="dd/mm/yyyy hh:ii" data-link-field="dtp_input1">
												<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
												<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
												<input name="dhLembrar" type="text" ReadOnly="True" class="form-control" id="dh" placeholder="Lembrar">
											</div>
										</li>
									</ul>
								</div>
							</div>
						</form>
						<div align="right">
							<input type="button" onclick="frmInserir.submit();" value="Inserir" class="btn btn-lg btn-success" />
						</div>
					</div>
					<c:forEach var="lembrete" items="${sessionScope.listaLembretes}">
						<div class="col-lg-4">
							<h2>${lembrete.titulo}</h2>
							<p>${lembrete.descricao}</p>
							<p><a class="btn btn-default" href="#janelaDetalhes${lembrete.id}" rel="modal">Detalhes &raquo;</a></p>
						</div>
						<div class="window" id="janelaDetalhes${lembrete.id}">
							<div class="panel panel-default">
								<div class="panel-body">
									<h2>
										<strong>${lembrete.titulo}</strong>
									</h2>
									<h5>
										<i>criado em <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${lembrete.dhCriacao}" /></i>
									</h5>
									<ul class="list-group">
										<li class="list-group-item"><strong>Descrição</strong><br /><h4>${lembrete.descricao}</h4></li>
										<li class="list-group-item"><strong>Local</strong><br /><h4>${lembrete.local}</h4></li>
										<li class="list-group-item"><strong>Início</strong><br /><h4><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${lembrete.dhInicio}" /></h4></li>
										<li class="list-group-item"><strong>Fim</strong><br /><h4><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${lembrete.dhFim}" /></h4></li>
										<li class="list-group-item"><strong>Lembrar</strong><br /><h4><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${lembrete.dhLembrar}" /></h4></li>
									</ul>
									<div align="right">
										<a class="btn btn-lg btn-warning" x="#janelaDetalhes${lembrete.id}" href="#janelaAlteracao${lembrete.id}" rel="modal">Alterar</a>
										<a class="btn btn-lg btn-danger" x="#janelaDetalhes${lembrete.id}" href="#janelaExclusao${lembrete.id}" rel="modal">Excluir</a>
									</div>
								</div>
							</div>
						</div>
						<div class="window" id="janelaAlteracao${lembrete.id}">
<%-- 							<form accept-charset="ISO-8859-1" name="frmAlteracao${lembrete.id}" onSubmit="return validarCamposCadastro(this);" method="POST" action="alterar.do"> --%>
							<form accept-charset="ISO-8859-1" name="frmAlteracao${lembrete.id}" method="POST" action="alterar.do">
								<div class="panel panel-default">
									<div class="panel-body">
										<h2>
											<strong>Alterar</strong>
										</h2>
										<hr />
										<div class="input-group input-group-lg">
											<span class="input-group-addon">Título</span> <input type="text" maxlength="50" class="form-control input-lg" placeholder="Título" name="titulo" value="${lembrete.titulo}">
										</div>
										<h6><i>criado em <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${lembrete.dhCriacao}" /></i></h6>
										<input type="hidden" name="dhCriacao" value="<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${lembrete.dhCriacao}" />" />
										<ul class="list-group">
											<li class="list-group-item">
												<div class="input-group input-group-sm">
													<span class="input-group-addon">Descrição</span>
													<textarea name="descricao" maxlength="300" class="input-sm" rows="6" placeholder="Descrição" >${lembrete.descricao}</textarea>
												</div>
											</li>
											<li class="list-group-item">
												<div class="input-group input-group-sm">
													<span class="input-group-addon">Local</span>
													<input name="local" maxlength="100" type="text" class="form-control input-sm" placeholder="Local" value="${lembrete.local}">
												</div>
											</li>
											<li class="list-group-item">
												<div class="input-group date form_datetime" data-date="${dataHora}" data-date-format="dd/mm/yyyy hh:ii" data-link-field="dtp_input1">
													<span class="input-group-addon">
														<span class="glyphicon glyphicon-calendar"></span>
													</span>
													<span class="input-group-addon">
														<span class="glyphicon glyphicon-remove"></span>
													</span>
													<input name="dhInicio" type="text" ReadOnly="True" class="form-control" id="dh" placeholder="Início" value="<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${lembrete.dhInicio}" />">
												</div>
											</li>
											<li class="list-group-item">
												<div class="input-group date form_datetime" data-date="${dataHora}" data-date-format="dd/mm/yyyy hh:ii" data-link-field="dtp_input1">
													<span class="input-group-addon">
														<span class="glyphicon glyphicon-calendar"></span>
													</span>
													<span class="input-group-addon">
														<span class="glyphicon glyphicon-remove"></span>
													</span>
													<input name="dhFim" type="text" ReadOnly="True" class="form-control" id="dh" placeholder="Fim" value="<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${lembrete.dhFim}" />">
												</div>
											</li>
											<li class="list-group-item">
												<div class="input-group date form_datetime" data-date="${dataHora}" data-date-format="dd/mm/yyyy hh:ii" data-link-field="dtp_input1">
													<span class="input-group-addon">
														<span class="glyphicon glyphicon-calendar"></span>
													</span>
													<span class="input-group-addon">
														<span class="glyphicon glyphicon-remove"></span>
													</span>
													<input name="dhLembrar" type="text" ReadOnly="True" class="form-control" id="dh" placeholder="Lembrar" value="<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${lembrete.dhLembrar}" />">
												</div>
											</li>
										</ul>
										<input type="hidden" name="idLembrete" value="${lembrete.id}" />
									</div>
								</div>
							</form>
							<div align="right">
								<input type="button" onclick="frmAlteracao${lembrete.id}.submit();" value="Alterar" class="btn btn-lg btn-success" />
							</div>
						</div>
						<div class="window" id="janelaExclusao${lembrete.id}">
							<div class="panel panel-default">
								<div class="panel-body">
									<h2>
										<strong>Excluir</strong>
									</h2>
									<hr />
									<p>Tem certeza que deseja excluir o lembrete <strong>${lembrete.titulo}</strong>?</p>
									<div align="right">
										<input type="button" onclick="frmExclusao${lembrete.id}.submit();" value="Excluir" class="btn btn-lg btn-success" />
									</div>
									<form name="frmExclusao${lembrete.id}" action="excluir.do" method="POST"><input type="hidden" name="idLembrete" value="${lembrete.id}" /></form>
								</div>
							</div>
						</div>
					</c:forEach>
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