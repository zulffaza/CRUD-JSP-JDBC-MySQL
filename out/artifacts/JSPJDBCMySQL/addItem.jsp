<%@ page import="JDBCMySQL.ItemModel" %><%--
  Created by IntelliJ IDEA.
  User: faza
  Date: 05/04/17
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Action Add Item</title>
</head>
<body>
    <jsp:useBean id="jdbcMySQL" class="JDBCMySQL.JDBCMySQL" scope="page" />

    <%
        boolean isSuccess = jdbcMySQL.createConnection();

        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        if (isSuccess) {
            ItemModel itemModel = new ItemModel();

            itemModel.setName(name);
            itemModel.setPrice(price);
            itemModel.setCategoryId(categoryId);

            int hasil = jdbcMySQL.insertData(itemModel);

            if (hasil == 1)
                out.print("<script> alert('Data berhasil ditambahkan'); </script>");
            else
                out.print("<script> alert('Data tidak berhasil ditambahkan'); </script>");
        } else
            out.print("<script> alert('Koneksi gagal dibuat'); </script>");

        response.sendRedirect("http://localhost:8080/JSPJDBCMySQL/");
    %>
</body>
</html>
