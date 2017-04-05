<%--
  Created by IntelliJ IDEA.
  User: faza
  Date: 05/04/17
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Action Delete Item</title>
</head>
<body>
    <jsp:useBean id="jdbcMySQL" class="JDBCMySQL.JDBCMySQL" scope="page" />

    <%
        boolean isSuccess = jdbcMySQL.createConnection();
        int id = Integer.parseInt(request.getParameter("id"));

        if (isSuccess) {
            int hasil = jdbcMySQL.deleteData(id);

            if (hasil == 1)
                out.print("<script> alert('Data berhasil dihapus'); </script>");
            else
                out.print("<script> alert('Data tidak berhasil dihapus'); </script>");
        } else
            out.print("<script> alert('Koneksi gagal dibuat'); </script>");

        response.sendRedirect("http://localhost:8080/JSPJDBCMySQL/");
    %>
</body>
</html>
