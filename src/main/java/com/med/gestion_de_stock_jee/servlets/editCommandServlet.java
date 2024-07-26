package com.med.gestion_de_stock_jee.servlets;

import com.med.gestion_de_stock_jee.repositories.RepoCommande;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "editCommandServlet" , value = "/edit-command-servlet")
public class editCommandServlet extends HttpServlet {
    private RepoCommande repoCommande ;
    @Override
    public void init() throws ServletException {
        super.init();
        this.repoCommande = new RepoCommande() ;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String commandId = req.getParameter("commandId" ) ;
        String status = req.getParameter("status") ;
        if(! (commandId.isEmpty() || status.isEmpty())) {
            repoCommande.modifierEtatCommande(Integer.parseInt(commandId) , status);
            resp.sendRedirect("/commands.jsp?message=the%20command%20was%20modified%20successful");
        }else {
            resp.sendRedirect("/commands.jsp?error=error%20%20in%20fields");
        }
    }
}
