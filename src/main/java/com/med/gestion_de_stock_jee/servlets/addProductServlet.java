package com.med.gestion_de_stock_jee.servlets;

import com.med.gestion_de_stock_jee.entities.Produit;
import com.med.gestion_de_stock_jee.repositories.RepoProduit;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name = "addProductServlet" , value = "/add-product-servlet")
public class addProductServlet extends HttpServlet {
    private RepoProduit repoProduit ;
    @Override
    public void init() throws ServletException {
        super.init();
        repoProduit = new RepoProduit() ;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name") ;
        String description = req.getParameter("description") ;
        String count = req.getParameter("count");
        String providerId = req.getParameter("provider");
        String price = req.getParameter("price") ;
        if(! (name.isEmpty() || description.isEmpty() || count.isEmpty() || providerId.isEmpty() || price.isEmpty())) {
            Produit produit = new Produit(name , description , Float.parseFloat(price) , Integer.parseInt(count) , Integer.parseInt(providerId));
            repoProduit.ajouteProduit(produit);
            resp.sendRedirect("/products.jsp?message=product%20added%20successful");
        }else {
            resp.sendRedirect("/products.jsp?error=invalid%20fields");
        }
    }
}
