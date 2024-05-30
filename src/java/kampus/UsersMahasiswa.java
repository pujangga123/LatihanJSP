/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kampus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class UsersMahasiswa extends Users {

    @Override
    public boolean baca(String id) {
        Connection connection = null;
        ResultSet rs = null;

        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // 1. sesuaikan string SQL
                String sql = "SELECT * FROM users where id=?";
                PreparedStatement st = connection.prepareStatement(sql);

                // 2. sesuaikan parameter
                st.setString(1, id);
                rs = st.executeQuery();

                if (rs.next()) {
                    //3. isi property dengan data yang dibaca dari database
                    this.id = rs.getString("nid");
                    this.nama = rs.getString("nama");
                    this.tipe = rs.getString("tipe");
                    this.status = rs.getString("status");
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
    
    
    public static List<UsersMahasiswa> getList() {
        List<UsersMahasiswa> result = new ArrayList<>();
        
        Connection connection = null;
        ResultSet rs = null;

        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // prepare select statement
                String sql = "SELECT nim, mahasiswa.nama, users.status "
                        + "FROM users inner join mahasiswa on mahasiswa.nim=users.id ";
                PreparedStatement st = connection.prepareStatement(sql);
                rs = st.executeQuery();

                while (rs.next()) {
                    UsersMahasiswa um = new UsersMahasiswa();
                    um.id = rs.getString("nim");
                    um.nama = rs.getString("nama");
                    um.tipe = "SISWA";
                    um.status = rs.getString("status");
                    result.add(um);
                }
                
            }
            return result;
        } catch (Exception ex) {
            return null;
        }
    }

}
