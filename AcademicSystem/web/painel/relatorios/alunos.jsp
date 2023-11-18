<%@page import="br.com.traue.academicsys.model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Student> alunos;
    alunos = (ArrayList) session.getAttribute("listaDeAlunos");

    boolean mostraPainelFiltro
            = (request.getParameter("idCurso") != null) ? true : false;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AcademicSys - Students</title>
    </head>
    <body>
        <jsp:include page="../menu.jsp"></jsp:include>
            <script src="../../js/modalExclusao.js"></script>
        <% if (mostraPainelFiltro) {%>
        <div class="container mt-4 pt-4">
            <div class="card" style="width: 90%; margin: 0 auto !important;">
                <div class="card-header bg-dark">
                    <p class="text-white">Filtro aplicado</p>
                </div>
                <div class="card-body">
                    <h6 class="card-title">Mostrando apenas alunos do curso:
                        <strong>
                            <%= alunos.get(0).getCurso().getNomeCurso()%>
                        </strong>
                    </h6>
                    <a href="loader.jsp?pagina=aluno" class="btn btn-primary">Limpar filtro</a>
                </div>
            </div>
        </div>
        <% }%>

        <div class="container mt-4">
            <div class="table-responsive-md" style="width: 90%; margin: 0 auto !important;">
                <table class="table justify-content-centeru">
                    <thead class="thead-dark">
                    <th scope="col">Student Number</th>
                    <th scope="col">Student Name</th>
                    <th scope="col">Course</th>
                    <th scope="col">Course Type</th>
                    <th scope="col" class="text-center">Edit</th>
                    <th scope="col" class="text-center">Delete</th>
                    </thead>
                    <tbody>
                        <% for (Student s : alunos) {%>
                        <tr>
                            <td><%=s.getRa() %></td>
                            <td><%=s.getNome()%></td>
                            <td><%=s.getCurso().getNomeCurso()%></td>
                            <td><%=s.getCurso().getTipoCurso()%></td>
                            <td class="text-center"><a class="btn btn-outline-primary" href="../cadastros/aluno.jsp?idAluno=<%=s.getIdAluno()%>">Editar</a></td>
                            <% if (mostraPainelFiltro) {%>
                            <td class="text-center"><a class="btn btn-outline-danger" id="deleteAluno" href="../AlunoController?acao=exclusao&idCurso=<%=alunos.get(0).getCurso().getIdCurso()%>&idAluno=<%=s.getIdAluno()%>">Excluir</td>
                            <% } else {%>
                            <td class="text-center"><a class="btn btn-outline-danger" id="deleteAluno" href="../AlunoController?acao=exclusao&idAluno=<%=s.getIdAluno()%>">Excluir</td>
                            <% } %>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
                <a class="btn btn-outline-info" href="#">Novo Aluno</a>
            </div>
        </div>
    </body>
</html>