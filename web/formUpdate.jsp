<%@ page import="JDBCMySQL.ItemModel" %><%--
  Created by IntelliJ IDEA.
  User: faza
  Date: 05/04/17
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Item</title>
</head>
<body>
    <jsp:useBean id="jdbcMySQL" class="JDBCMySQL.JDBCMySQL" scope="page" />

    <%
        ItemModel model = null;

        boolean isSuccess = jdbcMySQL.createConnection();
        int id = Integer.parseInt(request.getParameter("id"));

        if (isSuccess) {
            model = jdbcMySQL.showDataAtId(id);

            if (model == null)
                out.print("<script> alert('Data tidak ditemukan'); </script>");
        } else
            out.print("<script> alert('Koneksi gagal dibuat'); </script>");
    %>

    <form name="addItem" method="post" action="updateItem.jsp">
        <input name="id" value="<%= model.getId() %>" hidden>

        <table style='border: 2px solid black'>
            <tr>
                <td>
                    Nama Barang : <input name="name" type="text" value="<%= model.getName() %>">
                </td>
            </tr>
            <tr>
                <td>
                    Harga Barang : <input name="price" type="number" value="<%= model.getPrice() %>">
                </td>
            </tr>
            <tr>
                <td>
                    Id Kategori Barang : <input name="categoryId" type="number" value="<%= model.getCategoryId() %>">
                </td>
            </tr>
            <tr>
                <td>
                    <input name="update" type="submit" value="Update">

                    <a href="http://localhost:8080/JSPJDBCMySQL/">
                        <button>Kembali</button>
                    </a>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
