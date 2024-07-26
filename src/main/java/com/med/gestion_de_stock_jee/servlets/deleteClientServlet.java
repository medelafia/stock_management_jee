package com.med.gestion_de_stock_jee.servlets;

import com.med.gestion_de_stock_jee.repositories.RepoClient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
@WebServlet(name = "deleteClientServlet" , value = "/delete-client-servlet")
public class deleteClientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RepoClient repoClient ;

    @Override
    public void init() throws ServletException  {
        repoClient = new RepoClient() ;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("idClient"));
        repoClient.supprimer_client(id);
        request.setAttribute("msg", "Client supprimé avec succès.");
        try {
            request.getRequestDispatcher("clients.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }
}
