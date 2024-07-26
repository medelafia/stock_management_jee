package com.med.gestion_de_stock_jee.servlets;

import com.med.gestion_de_stock_jee.entities.Commande;
import com.med.gestion_de_stock_jee.repositories.RepoCommande;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "addCommandServlet" , value = "/add-command-servlet")
public class addCommandServlet extends HttpServlet {
    private RepoCommande repoCommande ;
    @Override
    public void init() throws ServletException {
        super.init();
        this.repoCommande = new RepoCommande() ;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String status = req.getParameter("status") ;
        String date = req.getParameter("date");
        String clientId = req.getParameter("clientId") ;
        if(!(status.isEmpty() || date.isEmpty() || clientId.isEmpty())) {
            repoCommande.ajouteCommande(new Commande(Date.valueOf(date) , Integer.parseInt(clientId) , status));
            resp.sendRedirect("/commands.jsp?message=the%20command%20was%20added%20successful");
        }
        else {
            resp.sendRedirect("/commands.jsp?error=invalid%20inputs%20field'");
        }
    }
}
