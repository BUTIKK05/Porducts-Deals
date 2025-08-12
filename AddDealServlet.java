package com.example.servlet;

import com.example.dao.DealDAO;
import com.example.model.Deal;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;

public class AddDealServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Deal deal = new Deal();
            deal.setType(req.getParameter("type"));
            deal.setToName(req.getParameter("to_name"));
            deal.setFromName(req.getParameter("from_name"));
            deal.setAddress(req.getParameter("address"));
            deal.setDate(new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("date")));
            deal.setAmount(Double.parseDouble(req.getParameter("amount")));

            new DealDAO().addDeal(deal);
            resp.sendRedirect("main");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}