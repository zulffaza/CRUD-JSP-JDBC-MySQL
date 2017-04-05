<%@ page import="JDBCMySQL.ItemModel" %>
<%@ page import="java.util.ArrayList" %>

<%--
  Created by IntelliJ IDEA.
  User: faza
  Date: 04/04/17
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JDBC Coba</title>
</head>
<body>
    <jsp:useBean id="jdbcMySQL" class="JDBCMySQL.JDBCMySQL" scope="page"/>

    <%
        boolean isSuccess = jdbcMySQL.createConnection();

        if (isSuccess) {
            ArrayList<ItemModel> dataList = jdbcMySQL.showData();

            if (dataList != null) {
                out.print(
                        "<table border='2'>" +
                                "<tr align='center'>" +
                                "<th>" + "Id" + "</th>" +
                                "<th>" + "Nama" + "</th>" +
                                "<th>" + "Harga" + "</th>" +
                                "<th>" + "Id Kategori" + "</th>" +
                                "<th colspan='2'>" + "Opsi" + "</th>" +
                                "</tr>"
                );

                for (ItemModel model : dataList) {
                    out.print(
                            "<tr align='center'>" +
                                    "<td>" + model.getId() + "</td>" +
                                    "<td>" + model.getName() + "</td>" +
                                    "<td>" + model.getPrice() + "</td>" +
                                    "<td>" + model.getCategoryId() + "</td>" +
                                    "<td>" +
                                    "<a href='http://localhost:8080/JSPJDBCMySQL/formUpdate.jsp?id=" + model.getId() + "'>" +
                                    "<button>Edit</button>" +
                                    "</a>" +
                                    "</td>" +
                                    "<td>" +
                                    "<a href='http://localhost:8080/JSPJDBCMySQL/deleteItem.jsp?id=" + model.getId() + "'>" +
                                    "<button>Hapus</button>" +
                                    "</a>" +
                                    "</td>" +
                                    "</tr>"
                    );
                }

                out.print("</table>");
            }
        } else
            out.print("<script> alert('Koneksi gagal dibuat'); </script>");
    %>

    <br>

    <a href="formAdd.html">
        <button>Tambah Data</button>
    </a>

</body>
</html>