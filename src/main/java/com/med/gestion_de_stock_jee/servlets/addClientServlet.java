package com.med.gestion_de_stock_jee.servlets;

import com.med.gestion_de_stock_jee.entities.Client;
import com.med.gestion_de_stock_jee.repositories.RepoClient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/AddClient")
public class addClientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RepoClient repoClient ;

    @Override
    public void init() throws ServletException {
        this.repoClient = new RepoClient() ;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName") ;
        String lastName = request.getParameter("firstName") ;
        String phone = request.getParameter("firstName") ;
        String email = request.getParameter("firstName") ;
        String address = request.getParameter("adress") ;
        repoClient.ajoute_client(new Client(firstName , lastName , email , phone , address ));
        request.setAttribute("msg", "Client ajouté avec succès.");
        try {
            request.getRequestDispatcher("./clients.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    }
}
