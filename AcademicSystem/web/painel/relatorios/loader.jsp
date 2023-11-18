<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carregando...</title>
    </head>
    <body>
        <jsp:include page="../../painel/menu.jsp"></jsp:include>
        <script>

            $(document).ready(function () {
                const urlParams = new URLSearchParams(window.location.search);
                const pagina = urlParams.get('pg');

                var url = '';

                if (pagina == 'cursos') {
                    var url = '../../CursoController?acao=LEITURA';
                } else {
                    url = '../../AlunoController?acao=LEITURA';
                    const idCurso = urlParams.get('idCurso');
                    if(idCurso != null)
                        url += '&idCurso=' + idCurso;
                }

                $(location).attr('href', url);
            });
        </script>

        <div class="text-center mt-4 pd-4">
            <br>
            <img src="../../assets/loading.gif" alt="Carregando...">        
        </div>
    </body>
</html>
