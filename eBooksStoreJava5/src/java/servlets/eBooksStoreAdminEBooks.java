/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet is serving eBooksStoreAdminEBooks.jsp
 *
 * @author Gheorghe Aurel Pacurar
 */
public class eBooksStoreAdminEBooks extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // declare specific DB info
        String user = "test";
        String password = "test";
        String url = "jdbc:derby://localhost:1527/ebooksstore;create=true;";
        String driver = "org.apache.derby.jdbc.ClientDriver";
        // check push on Insert button
        if (request.getParameter("admin_ebooks_insert") != null) { // insert values from fields
            // set connection paramters to the DB
            // read values from page fields
            String isbn = request.getParameter("admin_ebooks_isbn");
            String title = request.getParameter("admin_ebooks_title");
            String type = request.getParameter("admin_ebooks_type");
            String quality = request.getParameter("admin_ebooks_quality");
            String pages = request.getParameter("admin_ebooks_pages");
            String genre = request.getParameter("admin_ebooks_genre");
            String price = request.getParameter("admin_ebooks_price");
            // declare specific DBMS operationsvariables
            ResultSet resultSet = null;
            Statement statement = null;
            Connection connection = null;
            PreparedStatement pstmnt = null;
            try {
                //check driver and create connection
                Class driverClass = Class.forName(driver);
                connection = DriverManager.getConnection(url, user, password);
                String DML = "INSERT INTO EBOOKS.EBOOKS VALUES (?, ?, ?, ?, ?, ?, ?)";
                pstmnt = connection.prepareStatement(DML);
                pstmnt.setString(1, isbn);
                pstmnt.setString(2, title);
                pstmnt.setString(3, type);
                pstmnt.setString(4, quality);
                pstmnt.setString(5, pages);
                pstmnt.setString(6, genre);
                pstmnt.setString(7, price);
                pstmnt.execute();

            } catch (ClassNotFoundException | SQLException ex) {
                // display a message for NOT OK
                Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                if (resultSet != null) {
                    try {
                        resultSet.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (statement != null) {
                    try {
                        statement.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (pstmnt != null) {
                    try {
                        pstmnt.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                // redirect page to its JSP as view
                request.getRequestDispatcher("./eBooksStoreAdminEBooks.jsp").forward(request, response);
            }
        } // check push on Update button
        else if (request.getParameter("admin_ebooks_update") != null) { // update
            // declare specific variables
            ResultSet resultSet = null;
            Statement statement = null;
            PreparedStatement pstmnt = null;
            Connection connection = null;
            try {
                //check driver and create connection
                Class driverClass = Class.forName(driver);
                connection = DriverManager.getConnection(url, user, password);
                // identify selected checkbox and for each execute the update operation
                String[] selectedCheckboxes = request.getParameterValues("admin_ebooks_checkbox");
                String isbn2 = request.getParameter("admin_ebooks_isbn");
                String title = request.getParameter("admin_ebooks_title");
                String type = request.getParameter("admin_ebooks_type");
                String quality = request.getParameter("admin_ebooks_quality");
                String pages = request.getParameter("admin_ebooks_pages");
                String genre = request.getParameter("admin_ebooks_genre");
                String price = request.getParameter("admin_ebooks_price");
                if (!(("".equals(title)) && ("".equals(pages)) && ("".equals(price)))) {
                    // operate updates for all selected rows
                    for (String s : selectedCheckboxes) {
                        // realize update of all selected rows
                        String isbn = s;
                        if ("".equals(title)) { // update all except title
                            String DML = "UPDATE EBOOKS.EBOOKS SET ISBN=?,id_type=?,id_quality=?,pages=?,id_genre=?,pret=? WHERE ISBN=?";
                            pstmnt = connection.prepareStatement(DML);
                            pstmnt.setString(1, isbn2);
                            pstmnt.setString(2, type);
                            pstmnt.setString(3, quality);
                            pstmnt.setString(4, pages);
                            pstmnt.setString(5, genre);
                            pstmnt.setString(6, price);
                            pstmnt.setString(7, isbn);
                        } else if ("".equals(pages)) {// update all except pages
                            String DML = "UPDATE EBOOKS.EBOOKS SET  isbn=?,denumire=?,id_type=?,id_quality=?,id_genre=?,pret=? WHERE ISBN=?";
                            pstmnt = connection.prepareStatement(DML);
                            pstmnt.setString(1, isbn2);
                            pstmnt.setString(2, title);
                            pstmnt.setString(3, type);
                            pstmnt.setString(4, quality);
                            pstmnt.setString(5, genre);
                            pstmnt.setString(6, price);
                            pstmnt.setString(7, isbn);
                        } else if ("".equals(price)) {// update all except price
                            String DML = "UPDATE EBOOKS.EBOOKS SET  isbn=?,denumire=?,id_type=?,id_quality=?,pages=?,id_genre=? WHERE ISBN=?";
                            pstmnt = connection.prepareStatement(DML);
                            pstmnt.setString(1, isbn2);
                            pstmnt.setString(2, title);
                            pstmnt.setString(3, type);
                            pstmnt.setString(4, quality);
                            pstmnt.setString(5, pages);
                            pstmnt.setString(6, genre);
                            pstmnt.setString(7, isbn);
                        } else if ("".equals(isbn2)) {// update all except isbn
                            String DML = "UPDATE EBOOKS.EBOOKS SET  denumire=?,id_type=?,id_quality=?,pages=?,id_genre=?,pret=? WHERE ISBN=?";
                            pstmnt = connection.prepareStatement(DML);
                            pstmnt.setString(1, title);
                            pstmnt.setString(2, type);
                            pstmnt.setString(3, quality);
                            pstmnt.setString(4, pages);
                            pstmnt.setString(5, genre);
                            pstmnt.setString(6, price);
                            pstmnt.setString(7, isbn);
                        } else {
                            String DML = "UPDATE EBOOKS.EBOOKS SET  ISBN=?,denumire=?,id_type=?,id_quality=?,pages=?,id_genre=?,pret=? WHERE ISBN=?";
                            pstmnt = connection.prepareStatement(DML);
                            pstmnt.setString(1, isbn2);
                            pstmnt.setString(2, title);
                            pstmnt.setString(3, type);
                            pstmnt.setString(4, quality);
                            pstmnt.setString(5, pages);
                            pstmnt.setString(6, genre);
                            pstmnt.setString(7, price);
                            pstmnt.setString(8, isbn);
                        }

                        boolean execute = pstmnt.execute();
                    }
                } else { // update for one or more selections - only type, quality and genre
                    for (String s : selectedCheckboxes) {
                        // realize update of all selected rows
                        String isbn = s;
                        String DML = "UPDATE EBOOKS.EBOOKS SET  id_type=?,id_quality=?,id_genre=? WHERE ISBN=?";
                        pstmnt = connection.prepareStatement(DML);
                        pstmnt.setString(1, type);
                        pstmnt.setString(2, quality);
                        pstmnt.setString(3, genre);
                        pstmnt.setString(4, isbn);
                        boolean execute = pstmnt.execute();
                    }
                }
            } catch (ClassNotFoundException | SQLException ex) {
                // display a message for NOT OK
                Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);

            } finally {
                if (resultSet != null) {
                    try {
                        resultSet.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (pstmnt != null) {
                    try {
                        pstmnt.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                // redirect page to its JSP as view
                request.getRequestDispatcher("./eBooksStoreAdminEBooks.jsp").forward(request, response);
            }
        } // check push on Delete button
        else if (request.getParameter("admin_ebooks_delete") != null) { // delete 
            // declare specific variables
            ResultSet resultSet = null;
            PreparedStatement pstmnt = null;
            Connection connection = null;
            try {
                //check driver and create connection
                Class driverClass = Class.forName(driver);
                connection = DriverManager.getConnection(url, user, password);
                // identify selected checkbox and for each execute the delete operation
                String[] selectedCheckboxes = request.getParameterValues("admin_ebooks_checkbox");
                // more critical DB operations should be made into a transaction
                connection.setAutoCommit(false);
                for (String s : selectedCheckboxes) {
                    // realize delete of all selected rows
                    String isbn = s;
                    String DML = "DELETE FROM EBOOKS.EBOOKS WHERE ISBN=?";
                    pstmnt = connection.prepareStatement(DML);
                    pstmnt.setString(1, isbn);
                    pstmnt.execute();
                }
                connection.commit();
                connection.setAutoCommit(true);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);
                if (connection != null) {
                    try {
                        connection.rollback();
                    } catch (SQLException ex1) {
                        Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex1);
                    }
                }
            } finally {
                if (resultSet != null) {
                    try {
                        resultSet.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (pstmnt != null) {
                    try {
                        pstmnt.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (pstmnt != null) {
                    try {
                        pstmnt.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (connection != null) {
                    try {
                        connection.setAutoCommit(true);
                    } catch (SQLException ex) {
                        Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);
                    } finally {
                        try {
                            connection.close();
                        } catch (SQLException ex) {
                            Logger.getLogger(eBooksStoreAdminEBooks.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
                // redirect page to its JSP as view
                request.getRequestDispatcher("./eBooksStoreAdminEBooks.jsp").forward(request, response);
            }
        } // check push on Cancel button
        else if (request.getParameter("admin_ebooks_cancel") != null) { // cancel
            request.getRequestDispatcher("./eBooksStoreMainPage.jsp").forward(request, response);
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
        return "Servlet serves eBooksSoreAdminEBooks.JSP page";
    }// </editor-fold>

}
