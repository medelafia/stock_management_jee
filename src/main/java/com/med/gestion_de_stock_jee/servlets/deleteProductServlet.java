package com.med.gestion_de_stock_jee.servlets;

import com.med.gestion_de_stock_jee.repositories.RepoProduit;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "deleteProductServlet" , value = "/delete-product-servlet")
public class deleteProductServlet extends HttpServlet {
    private RepoProduit repoProduit ;
    @Override
    public void init() throws ServletException {
        super.init();
        this.repoProduit = new RepoProduit();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("productId") != null) {
            int productId = Integer.parseInt(req.getParameter("productId")) ;
            repoProduit.supprimerProduit(productId);
            resp.sendRedirect("/products.jsp?message='product deleted successful'");
        }
    }
}
