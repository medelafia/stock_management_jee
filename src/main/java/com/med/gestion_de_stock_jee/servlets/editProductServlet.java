package com.med.gestion_de_stock_jee.servlets;

import com.med.gestion_de_stock_jee.entities.Produit;
import com.med.gestion_de_stock_jee.repositories.RepoProduit;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "editProductServlet" , value = "/edit-product-servlet")
public class editProductServlet extends HttpServlet {
    private RepoProduit repoProduit ;
    @Override
    public void init() throws ServletException {
        super.init();
        repoProduit = new RepoProduit() ;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("productId") ;
        String name = req.getParameter("name") ;
        String description = req.getParameter("description") ;
        String price = req.getParameter("price") ;
        String count = req.getParameter("count") ;
        String provider = req.getParameter("provider") ;
        if(!(id.isEmpty() || name.isEmpty() || description.isEmpty() || price.isEmpty() || count.isEmpty() || provider.isEmpty())) {
            repoProduit.modifierProduit(new Produit(Integer.parseInt(id) , name , description , Float.parseFloat(price) , Integer.parseInt(count) , Integer.parseInt(provider)));
            resp.sendRedirect("/products.jsp?productId="+id+"&edit=&message=the%20product%20was%20modified%20successful");
        }else {
            resp.sendRedirect("/products.jsp?productId="+id+"&edit=&error=invalid%20inputs");
        }
    }
}
