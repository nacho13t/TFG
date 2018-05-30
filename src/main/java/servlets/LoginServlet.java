/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.mycompany.multiplayerbiblio.User;
import db.UserManagement;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author nacho
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NoSuchAlgorithmException {

        if (request.getParameter("access_token") != null) {
            System.out.println("LOGIN SERVLET");
            
            String url = "https://graph.facebook.com/v3.0/me?fields=id%2Cname&access_token="+request.getParameter("access_token");
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("User-Agent", "Mozilla/5.0");
            int responseCode = con.getResponseCode();
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer resp = new StringBuffer();
            while((inputLine = in.readLine()) != null){
                resp.append(inputLine);
            }
            in.close();
            
            JSONObject myresponse = new JSONObject(resp.toString());
            String id_raw = myresponse.getString("id");
            String id_raw2 = id_raw.replace("\"", "");
            
            System.out.println(id_raw2);
            
            long id = Long.parseLong(id_raw2);
            String name = myresponse.getString("name");
            int user_id = UserManagement.validateFBUser(id);
            
            if(user_id != 0){
                HttpSession session = request.getSession();
                session.setAttribute("user", UserManagement.getUser(user_id));
                response.sendRedirect("Content.jsp");
            }else{
                User user = UserManagement.registerUserFB(id, name);
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("Content.jsp");
            }
            
        } else {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            String username = request.getParameter("name");
            String pass = request.getParameter("pass");

            if ((pass != null)&&(UserManagement.validateUser(username, pass))) {
                HttpSession session = request.getSession();
                session.setAttribute("user", UserManagement.getUser(username));
                response.sendRedirect("Content.jsp");
            } else {
                response.sendRedirect("WarningLoginError.jsp");
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
        } catch (SQLException | NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException | NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
