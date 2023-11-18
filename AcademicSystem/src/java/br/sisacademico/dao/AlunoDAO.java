package br.sisacademico.dao;

import br.sisacademico.model.Aluno;
import br.sisacademico.model.Curso;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AlunoDAO {

    private static Statement stm = null;

    public ArrayList<Aluno> getAlunos(Integer... idCurso) throws SQLException {
        ArrayList<Aluno> alunos = new ArrayList<>();

        String query = "SELECT a.idAluno, "
                + "	  a.ra, "
                + "       a.nome, "
                + "       c.idCurso, "
                + "       c.nomeCurso, "
                + "       c.tipoCurso "
                + "FROM aluno as a "
                + "	INNER JOIN curso as c "
                + "     ON a.idCurso = c.idCurso";

        if (idCurso.length != 0) {
            query += " WHERE c.idCurso = " + idCurso[0];
        }

        query += " ORDER BY a.NOME, c.NomeCurso";

        stm = ConnectionFctory.getConnection().createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

        ResultSet resultado = stm.executeQuery(query);

        while (resultado.next()) {
            Aluno a = new Aluno();
            Curso c = new Curso();

            a.setIdAluno(resultado.getInt("idAluno"));
            a.setNome(resultado.getString("nome"));
            a.setRa(resultado.getInt("ra"));

            c.setIdCurso(resultado.getInt("idCurso"));
            c.setNomeCurso(resultado.getString("nomeCurso"));
            c.setTipoCurso(resultado.getString("tipoCurso"));

            a.setCurso(c);

            alunos.add(a);
        }

        stm.getConnection().close();

        return alunos;
    }
}
