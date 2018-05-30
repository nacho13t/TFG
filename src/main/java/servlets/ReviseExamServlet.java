/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.mycompany.multiplayerbiblio.User;
import inventory.InventoryItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nacho
 */
public class ReviseExamServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        int answersCount = Integer.parseInt(request.getParameter("answersCount"));
        int mark = 0;
        for (int i = 1; i < answersCount; i++) {
            mark += Integer.parseInt(request.getParameter("options"+i));
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("note", mark+"/"+(answersCount-1));
        if(mark==answersCount-1){
            User user = (User) session.getAttribute("user");
            if(request.getParameter("jokerUsed").equals("true")){
                InventoryItem joker = null;
                for (InventoryItem item : user.inventory().getItems()) {
                    if(item.type().equals("Joker")) joker = item;
                }
                joker.use(user);
                }
            
            if(!user.getCompletedExams()[Integer.parseInt(request.getParameter("examId"))]){
                user.completeExam(Integer.parseInt(request.getParameter("examId")));
                user.gainExperience(Integer.parseInt(request.getParameter("points")));
            }
            session.setAttribute("lessonCompleted", "true");
        }
        session.setAttribute("examInProgress", "false");
        response.sendRedirect("Sala-1.jsp");
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
            Logger.getLogger(ReviseExamServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ReviseExamServlet.class.getName()).log(Level.SEVERE, null, ex);
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
