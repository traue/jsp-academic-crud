package br.sisacademico.dao;

import br.sisacademico.model.Curso;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

public class CursoDAO {

    private static Statement stm = null;

    public Map<Curso, Integer> getTodosCursosCountAlunos() throws SQLException {

        String query = "SELECT idCurso, nomeCurso, tipoCurso,"
                + "    (SELECT COUNT(*) "
                + "       FROM aluno"
                + "      WHERE idCurso = CURSO.idCurso) AS QTD_ALUNOS"
                + " FROM"
                + "    curso as CURSO"
                + " ORDER BY"
                + "    CURSO.nomeCurso";

        Map<Curso, Integer> relatorio = new LinkedHashMap<>();

        stm = ConnectionFctory.getConnection().createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

        ResultSet resultados = stm.executeQuery(query);

        while (resultados.next()) {
            Curso c = new Curso();
            c.setIdCurso(resultados.getInt("idCurso"));
            c.setNomeCurso(resultados.getString("nomeCurso"));
            c.setTipoCurso(resultados.getString("tipoCurso"));
            int qtdAlunos = resultados.getInt("QTD_ALUNOS");

            relatorio.put(c, qtdAlunos);
        }

        stm.getConnection().close();

        return relatorio;
    }
}
