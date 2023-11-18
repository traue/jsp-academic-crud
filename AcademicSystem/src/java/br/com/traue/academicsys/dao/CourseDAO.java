package br.com.traue.academicsys.dao;

import br.com.traue.academicsys.model.Course;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

public class CourseDAO {

    private static Statement stm = null;

    public Map<Course, Integer> getTodosCursosCountAlunos() throws SQLException {

        String query = "SELECT courseId, courseName, courseType,"
                + "   (SELECT COUNT(*) "
                + "    FROM student"
                + "    WHERE courseId = COURSE.courseId) AS STD_COUNT"
                + "   FROM"
                + "   course as COURSE"
                + "   ORDER BY"
                + "   COURSE.courseName";

        Map<Course, Integer> relatorio = new LinkedHashMap<>();

        stm = ConnectionFctory.getConnection().createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

        ResultSet resultados = stm.executeQuery(query);

        while (resultados.next()) {
            Course c = new Course();
            c.setIdCurso(resultados.getInt("courseID"));
            c.setNomeCurso(resultados.getString("courseName"));
            c.setTipoCurso(resultados.getString("courseType"));
            int qtdAlunos = resultados.getInt("STD_COUNT");

            relatorio.put(c, qtdAlunos);
        }

        stm.getConnection().close();

        return relatorio;
    }
}
