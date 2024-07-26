package com.med.gestion_de_stock_jee.servlets;

import com.med.gestion_de_stock_jee.repositories.RepoCommande;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "deleteCommandServlet" , value = "/delete-command-servlet")
public class deleteCommandServlet extends HttpServlet {
    private RepoCommande repoCommande ;
    @Override
    public void init() throws ServletException {
        super.init();
        this.repoCommande = new RepoCommande() ;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String commandId = req.getParameter("commandId") ;
        if(repoCommande.trouverCommandeAvecId(Integer.parseInt(commandId)) != null ) {
            repoCommande.supprimer_Commande(Integer.parseInt(commandId));
            resp.sendRedirect("/commands.jsp?message=the%20product%20was%20deleted%20successful");
        }else {
            resp.sendRedirect("/commands.jsp?error=the%20product%20not%20exist");
        }
    }
}
