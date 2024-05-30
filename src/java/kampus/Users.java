package kampus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public abstract class Users {

    public String id;
    public String tipe;
    public String status;
    protected String nama;
    protected String errMsg = "";

    abstract public boolean baca(String id);
    
    public boolean tambah() {
        Connection connection = null;

        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // 1. sesuaikan string SQL
                String sql = "INSERT INTO users (id,tipe,status,passwd) values (?,?,?,md5('123'))";
                PreparedStatement st = connection.prepareStatement(sql);

                // 2. sesuaikan parameter
                st.setString(1, this.id);
                st.setString(2, this.tipe);
                st.setString(3, this.status);
                st.executeUpdate();
                connection.close();
                return true; // menandakan kalau operasi INSERT berhasil
            } else {
                return false; // menandakan kalau operasi GAGAL
            }
        } catch (Exception ex) {
            //System.out.println(ex.toString());
            this.errMsg = ex.toString();

            return false; // menandakan kalau operasi GAGAL
        }
    }

    public void setPassword(String passwordBaru) {
        Connection connection = null;
        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // prepare select statement
                String sql = "UPDATE users SET passwd=md5(?) "
                        + "WHERE id=?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, passwordBaru);
                st.setString(2, this.id);

                st.executeUpdate();
                connection.close();
            }
            connection.close();
            this.errMsg = "Koneksi ke database gagal";
        } catch (Exception ex) {
            this.errMsg = ex.toString();
        }
    }
    
    public boolean update() {
        Connection connection = null;
        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // 1. sesuaikan string SQL
                String sql = "UPDATE users SET tipe=?, status=? WHERE id=?";
                PreparedStatement st = connection.prepareStatement(sql);

                // 2. sesuaikan parameter
                st.setString(1, this.tipe);
                st.setString(2, this.status);
                st.setString(3, this.id);

                st.executeUpdate();
                connection.close();
                return true; // menandakan kalau operasi UPDATE BERHASIL
            } else {
                return false; // menandakan kalau operasi GAGAL
            }
        } catch (Exception ex) {
            //System.out.println(ex.toString());
            this.errMsg = ex.toString();
            return false; // menandakan kalau operasi GAGAL
        }
    }
    
    public boolean login(String id, String passwd) {
        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        Connection connection = null;
        ResultSet rs = null;

        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // 1. sesuaikan string SQL
                String sql = "SELECT * FROM users where id=? and passwd=md5(?)";
                PreparedStatement st = connection.prepareStatement(sql);

                // 2. sesuaikan parameter
                st.setString(1, id);
                st.setString(1, passwd);

                rs = st.executeQuery();

                if (rs.next()) {
                    connection.close();
                    return true; // menandakan data ditemukan
                }
            }
            return false; // menandakan koneksi error/data tidak ditemukan
        } catch (Exception ex) {
            this.errMsg = ex.toString();
            return false; // menandakan data tidak ditemukan/error
        }
    }
    
    public String getNama() {
        return this.nama;
    }

    public String getErrMsg() {
        return this.errMsg;
    }
}
