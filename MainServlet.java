package com.example.servlet;

import com.example.dao.DealDAO;
import com.example.model.Deal;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

public class MainServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DealDAO dao = new DealDAO();
        try {
            List<Deal> deals = dao.getAllDeals();
            int barterCount = dao.getBarterCount2024();
            double avgSale = dao.getAverageSaleAmount();

            req.setAttribute("deals", deals);
            req.setAttribute("barterCount", barterCount);
            req.setAttribute("avgSale", avgSale);
            req.setAttribute("currentTime", new Date());
            req.setAttribute("surname", "Бут-Гусаим");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}