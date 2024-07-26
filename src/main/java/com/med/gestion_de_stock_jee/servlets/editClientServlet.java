package com.med.gestion_de_stock_jee.servlets;

import com.med.gestion_de_stock_jee.entities.Client;
import com.med.gestion_de_stock_jee.repositories.RepoClient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "editClientServlet" , value = "/edit-client-servlet")
public class editClientServlet extends HttpServlet  {
    private RepoClient repoClient ;
    @Override
    public void init() throws ServletException {
        super.init();
        this.repoClient = new RepoClient() ;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("idClient")) ;
        String firstName = req.getParameter("firstName") ;
        String lastName = req.getParameter("lastName") ;
        String phone = req.getParameter("phone") ;
        String email = req.getParameter("email") ;
        String address = req.getParameter("adress") ;
        repoClient.modifier_client(new Client(id , firstName , lastName , email , phone , address ));
        resp.sendRedirect("/clients.jsp");
    }
}
