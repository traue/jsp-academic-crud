package br.com.traue.academicsys.dao;

import br.com.traue.academicsys.model.Student;
import br.com.traue.academicsys.model.Course;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StudentDAO {

    private static Statement stm = null;

    public ArrayList<Student> getAlunos(Integer... idCurso) throws SQLException {
        ArrayList<Student> alunos = new ArrayList<>();

        String query = "SELECT "
                + "    s.id, "
                + "    s.studentNumber, "
                + "    s.studentName,"
                + "    c.courseId, "
                + "    c.courseName, "
                + "    c.courseType "
                + " FROM student as s "
                + " INNER JOIN course as c "
                + " ON s.courseId = c.courseId";

        if (idCurso.length != 0) {
            query += " WHERE c.courseId = " + idCurso[0];
        }

        query += " ORDER BY s.studentName, c.courseName";

        stm = ConnectionFctory.getConnection().createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

        ResultSet resultado = stm.executeQuery(query);

        while (resultado.next()) {
            Student a = new Student();
            Course c = new Course();

            a.setIdAluno(resultado.getInt("id"));
            a.setNome(resultado.getString("studentName"));
            a.setRa(resultado.getInt("studentNumber"));

            c.setIdCurso(resultado.getInt("courseId"));
            c.setNomeCurso(resultado.getString("courseName"));
            c.setTipoCurso(resultado.getString("courseType"));

            a.setCurso(c);

            alunos.add(a);
        }

        stm.getConnection().close();

        return alunos;
    }
}
