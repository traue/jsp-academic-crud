package br.com.traue.academicsys.controllers;

import br.com.traue.academicsys.dao.CourseDAO;
import br.com.traue.academicsys.model.Course;
import br.com.traue.academicsys.util.DaoActionsEnum;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CourseController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            DaoActionsEnum acao = DaoActionsEnum.valueOf(request.getParameter("acao"));
            CourseDAO cDAO = new CourseDAO();
            switch (acao) {
                case READ:
                    Map<Course, Integer> cursos = cDAO.getTodosCursosCountAlunos();

                    //forma 1: Colocando o map na sessão:
                    HttpSession session = request.getSession();
                    session.setAttribute("listaDeCursos", cursos);
                    response.sendRedirect("./painel/relatorios/cursos.jsp");

                    //forma 2: Enviando o mapa via parâmetro do request:
                    //request.setAttribute("listaDeCursos", cursos);
                    //request.getRequestDispatcher("/relatorios.curso.jsp").forward(request, response);                    
                    break;
                default:
                    break;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CourseController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CourseController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
