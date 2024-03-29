package com.mohai.one.springbootservlet.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class FirstServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("FirstServlet正在执行doGet");
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("FirstServlet正在执行doPost");
        //获取响应输出流PrinterWriter对象
        PrintWriter out = resp.getWriter();
        //使用输出流对象向客户端发送信息
        out.println("I'm a FirstServlet");//I'm a FirstServlet 会在客户端显示
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("FirstServlet正在执行init");
        super.init(config);
    }
}
