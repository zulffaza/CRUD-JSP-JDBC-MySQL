package JDBCMySQL;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by faza on 30/03/17.
 */
public class JDBCMySQL {

    private Connection connection;

    public JDBCMySQL() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        connection = null;
    }

    public boolean createConnection() {
        String url = "jdbc:mysql://localhost:3306/MyMart";
        String username = "root";
        String password = "D4ITA2015";

        boolean isSuccess = true;

        try {
            connection = DriverManager.getConnection(url, username, password); // Membuat koneksi ke database
        } catch (SQLException e) {
            e.printStackTrace();

            isSuccess = false;
        }

        return isSuccess;
    }

    public boolean closeConnection() {
        boolean isSuccess = true;

        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();

            isSuccess = false;
        }

        return isSuccess;
    }

    private Statement createStatement() {
        Statement statement = null;

        try {
            statement = connection.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return statement;
    }

    public int insertData(ItemModel itemModel) {
        Statement statement = createStatement();
        int hasil = -1;

        if (statement != null) {
            String sql = "INSERT INTO item(name, price, category_id) VALUES('" + itemModel.getName() + "', " + itemModel.getPrice() + ", " + itemModel.getCategoryId() + ")";

            try {
                hasil = statement.executeUpdate(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return hasil;
    }

    public int updateData(ItemModel itemModel) {
        Statement statement = createStatement();
        int hasil = -1;

        if (statement != null) {
            String sql = "UPDATE item SET name = '" + itemModel.getName() + "', price = " + itemModel.getPrice() + ", category_id = " + itemModel.getCategoryId() + " WHERE id = " + itemModel.getId();

            try {
                hasil = statement.executeUpdate(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return hasil;
    }

    public ArrayList<ItemModel> showData() {
        ArrayList<ItemModel> dataList = null;
        Statement statement = createStatement();

        if (statement != null) {
            String sql = "SELECT * FROM item";
            ResultSet resultSet = null;

            try {
                resultSet = statement.executeQuery(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (resultSet != null) {
                dataList = new ArrayList<>();

                try {
                    while (resultSet.next()) {
                        ItemModel itemModel = new ItemModel();

                        itemModel.setId(resultSet.getInt(1));
                        itemModel.setName(resultSet.getString(2));
                        itemModel.setPrice(resultSet.getInt(3));
                        itemModel.setCategoryId(resultSet.getInt(4));

                        dataList.add(itemModel);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return dataList;
    }

    public ItemModel showDataAtId(int id) {
        ItemModel model = null;
        Statement statement = createStatement();

        if (statement != null) {
            String sql = "SELECT * FROM item WHERE id = " + id;
            ResultSet resultSet = null;

            try {
                resultSet = statement.executeQuery(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (resultSet != null) {
                model = new ItemModel();

                try {
                    while (resultSet.next()) {
                        model.setId(resultSet.getInt(1));
                        model.setName(resultSet.getString(2));
                        model.setPrice(resultSet.getInt(3));
                        model.setCategoryId(resultSet.getInt(4));
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return model;
    }

    public int deleteData(int id) {
        Statement statement = createStatement();
        int hasil = -1;

        if (statement != null) {
            String sql = "DELETE FROM item WHERE id = " + id;

            try {
                hasil = statement.executeUpdate(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return hasil;
    }

    public Connection getConnection() {
        return connection;
    }
}