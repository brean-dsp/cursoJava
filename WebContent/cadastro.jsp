<jsp:useBean id="calcula" class="beans.Beanportfolio"
	type="beans.Beanportfolio" scope="page" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de usu�rio</title>
<link rel="stylesheet" href="resources/css/cadastro.css">
<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>

</head>
<body>

	<a href="acessoliberado.jsp">Inic�o</a>
	<a href="index.jsp">Sair</a>

	<center>
		<h1>CADASTRO</h1>
		<h3 style="color: blue;">${msg}</h3>
	</center>

	<form action="salvarUsuario" method="post" id="formUser"
		onsubmit="return validarCampos() ? true : false;" enctype="multipart/form-data">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>ID:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${user.id}"></td>
						<td>CEP:</td>
						<td><input type="text" id="cep" name="cep"
							onblur="consultaCep();" value="${user.cep}" placeholder="Informe cep"></td>
					</tr>
					<tr>
						<td>LOGIN:</td>
						<td><input type="text" id="login" name="login"
							value="${user.login}" placeholder="Informe o login"></td>
						<td>RUA:</td>
						<td><input type="text" id="rua" name="rua"
							value="${user.rua}"placeholder="Informe a rua"></td>
					</tr>
					<tr>
						<td>SENHA:</td>
						<td><input type="password" id="senha" name="senha"
							value="${user.senha}" placeholder="Informe a senha"></td>
						<td>BAIRRO:</td>
						<td><input type="text" id="bairro" name="bairro"
							value="${user.bairro}" placeholder="Informe o bairro "></td>
					</tr>
					<tr>
						<td>NOME:</td>
						<td><input type="text" id="nome" name="nome"
							value="${user.nome}" placeholder="Informe o nome"></td>
						<td>CIDADE:</td>
						<td><input type="text" id="cidade" name="cidade"
							value="${user.cidade}" placeholder="Informe a cidade"></td>
					</tr>
					<tr>
						<td>TELEFONE:</td>
						<td><input type="text" id="telefone" name="telefone"
							value="${user.telefone}" placeholder="Informe o telefone"></td>
						<td>ESTADO:</td>
						<td><input type="text" id="estado" name="estado"
							value="${user.estado}" placeholder="Informe o estado"></td>
					</tr>
					<tr>
						<td>IBGE:</td>
						<td><input type="text" id="ibge" name="ibge"
							value="${user.ibge}" placeholder="Informe o IBGE"></td>
					</tr>
					
					<tr>
						<td>FOTO:</td>
						<td><input type="file" name="foto" value="Foto"></td>
					</tr>
					
					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"><input
							type="submit" value="Cancelar"
							onclick="document.getElementById('formUser').action='salvarUsuario?acao=reset'"></td>
					</tr>
				</table>
			</li>
		</ul>
	</form>
	<div class="tabela">
		<table class="responsive-table">
			<caption>Usu�rios cadastrados</caption>
			<tr>
				<th>ID</th>
				<th>LOGIN</th>
				<th>FOTO</th>
				<th>NOME</th>
				<th>CEP</th>
				<th>RUA</th>
				<th>BAIRRO</th>
				<th>CIDADE</th>
				<th>ESTADO</th>
				<th>IBGE</th>
				<th>EXCLUIR</th>
				<th>EDITAR</th>
				<th>TELEFONES</th>
			</tr>
			<tbody>
				<c:forEach items="${usuarios}" var="user">
					<tr>
						<td style="width: 150px"><c:out value="${user.id}"></c:out></td>
						<td style="width: 150px"><c:out value="${user.login}"></c:out></td>
						<td><a href="salvarUsuario?acao=download&user=${user.id}"><img src='<c:out value="${user.tempFotoUser}"></c:out>' alt="Imagem User" title="Imagem User" width="32px" height="32px"></a></td>
						<td><c:out value="${user.nome}"></c:out></td>
						<td><c:out value="${user.cep}"></c:out></td>
						<td><c:out value="${user.rua}"></c:out></td>
						<td><c:out value="${user.bairro}"></c:out></td>
						<td><c:out value="${user.cidade}"></c:out></td>
						<td><c:out value="${user.estado}"></c:out></td>
						<td><c:out value="${user.ibge}"></c:out></td>

						<td><a href="salvarUsuario?acao=delete&user=${user.id}"><img
								src="resources/img/images.png" alt="Excluir" title="Excluir"
								width="20px" height="20px"></a></td>

						<td><a href="salvarUsuario?acao=editar&user=${user.id}"><img
								alt="Editar" src="resources/img/Edit-validated-icon.png"
								title="Editar" width="20px" height="20px"></a></td>

						<td><a href="salvarTelefones?acao=addFone&user=${user.id}"><img
								alt="Telefones" src="resources/img/telefone.png"
								title="Telefones" width="20px" height="20px"></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script type="text/javascript">
		function validarCampos() {
			if (document.getElementById("login").value == '') {
				alert('Informe o Login');
				return false;
			} else if (document.getElementById("senha").value == '') {
				alert('Informe a Senha');
				return false;
			} else if (document.getElementById("nome").value == '') {
				alert('Informe o Nome');
				return false;
			} else if (document.getElementById("telefone").value == '') {
				alert('Informe o Telefone');
				return false;
			}

			return true;
		}

		function consultaCep() {
			var cep = $("#cep").val();

			//Consulta o webservice viacep.com.br/
			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {

							$("#rua").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#cidade").val(dados.localidade);
							$("#estado").val(dados.uf);
							$("#ibge").val(dados.ibge);

						} //end if.
						else {

							$("#cep").val('');
							$("#rua").val('');
							$("#bairro").val('');
							$("#cidade").val('');
							$("#estado").val('');
							$("#ibge").val('');
							//CEP pesquisado n�o foi encontrado.
							alert("CEP n�o encontrado.");
						}
					});
		}
	</script>


</body>
</html>