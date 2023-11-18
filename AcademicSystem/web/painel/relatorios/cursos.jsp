<%@page import="br.com.traue.academicsys.model.Course"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setContentType("text/html; charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    Map<Course, Integer> listaDeCursos = (Map) session.getAttribute("listaDeCursos");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="../menu.jsp"></jsp:include>
            <script src="../../js/modalExclusao.js"></script>
            <script>
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip();
                });
            </script>
            <div class="container mt-4 pt-4">
                <div class="table-responsive">
                    <table class="table justify-content-center">
                        <thead>
                        <th scope="col">Course</th>
                        <th scope="col" class="text-center">Course Type</th>
                        <th scope="col" class="text-center">Number of Students</th>
                        <th scope="col" class="text-center">Students</th>
                        <th scope="col" class="text-center">Edit</th>
                        <th scope="col" class="text-center">Delete</th>
                        </thead>
                        <tbody>
                        <% for (Map.Entry<Course, Integer> c : listaDeCursos.entrySet()) {%>
                        <tr>
                            <td><%= c.getKey().getNomeCurso()%></td>
                            <td class="text-center"><%= c.getKey().getTipoCurso()%></td>
                            <td class="text-center"><%= c.getValue()%></td>

                            <% if (c.getValue() == 0) { %>
                            <td class="text-center">
                                <span class="d-inline-block" data-toggle="tooltip" title="No students">
                                    <button class="btn btn-secondary" disabled 
                                            style="pointer-events: none;" type="button">Students in this course</button>
                                </span>
                            </td>
                            <% } else {%>
                            <td class="text-center">
                                <a href="./loader.jsp?pagina=aluno&idCurso=<%=c.getKey().getIdCurso()%>" class="btn btn-outline-info">Students in this course</a>
                            </td>
                            <% }%>

                            <td class="text-center">
                                <a class="btn btn-outline-success" href="../cadastros/curso.jsp?idCurso=<%=c.getKey().getIdCurso()%>">Edit</a>
                            </td>
                            <% if (c.getValue() != 0) { %>
                            <td class="text-center">
                                <span class="d-inline-block" data-toggle="tooltip" title="Zero students">
                                    <button class="btn btn-secondary" disabled 
                                            style="pointer-events: none;" type="button">Delete</button>
                                </span>
                            </td>
                            <% } else {%>
                            <td class="text-center">
                                <a href="../CursoController?acao=exclusao&idCurso=<%=c.getKey().getIdCurso()%>" id="deleteCurso" class="btn btn-outline-danger">Delete</a>
                            </td>
                            <% } %>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
                <a href="../cadastros/curso.jsp" class="btn btn-success">New Course</a>
            </div>
        </div>
    </body>
</html>