/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.efrei.Controllers;

import fr.efrei.DAO.EmployesDAO;
import fr.efrei.entities.Employes;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Amaury
 */
public class DeleteController extends AbstractController {

    @EJB
    EmployesDAO employesDAO;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     * 
     * Check if the user is logged in, else redirect to login page.
     * Delete the user passed in parameters
     * 
     * On error redirects to list employee page
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Properties prop=this.initProperty(request);
        if(request.getSession().getAttribute(prop.getProperty("ATTRIBUT_IDENTIFIANT"))==null){
            response.sendRedirect(prop.getProperty("URL_LOGIN"));
            return;
        }
        
        String id=request.getParameter(prop.getProperty("PARAMETER_EMPLOYES_ID"));
        if(id==null){
            request.getSession().setAttribute(prop.getProperty("ATTRIBUT_MESSAGE_ERROR"),prop.getProperty("MESSAGE_DELETE_ERROR"));
        }
        else{
            try{
                Employes e = (Employes) this.employesDAO.findOne(Integer.parseInt(id));
                if(e!=null){
                    this.employesDAO.delete(e);
                    request.getSession().setAttribute(prop.getProperty("ATTRIBUT_MESSAGE_INFO"),prop.getProperty("MESSAGE_DELETE_INFO"));
                }
            }
            catch(NumberFormatException ex){
                Logger.getLogger(DetailsController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        response.sendRedirect(prop.getProperty("URL_LIST"));
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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Delete the employee passed in parameter (both get and post requests).";
    }// </editor-fold>

}
