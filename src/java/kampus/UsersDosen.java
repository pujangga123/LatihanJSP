package kampus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsersDosen extends Users {

    @Override
    public boolean baca(String id) {
        Connection connection = null;
        ResultSet rs = null;

        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // 1. sesuaikan string SQL
                String sql = "SELECT id, dosen.nama, users.tipe, users.status FROM users inner join dosen on nid=id where id=?";
                PreparedStatement st = connection.prepareStatement(sql);

                // 2. sesuaikan parameter
                st.setString(1, id);
                rs = st.executeQuery();

                if (rs.next()) {
                    //3. isi property dengan data yang dibaca dari database
                    this.id = rs.getString("id");
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
    
    
    public static List<UsersDosen> getList() {
        List<UsersDosen> result = new ArrayList<>();
        
        Connection connection = null;
        ResultSet rs = null;

        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // prepare select statement
                String sql = "SELECT id, dosen.nama, users.status "
                        + "FROM users inner join dosen on dosen.nid=users.id ";
                PreparedStatement st = connection.prepareStatement(sql);
                rs = st.executeQuery();

                while (rs.next()) {
                    UsersDosen ud = new UsersDosen();
                    ud.id = rs.getString("id");
                    ud.nama = rs.getString("nama");
                    ud.tipe = "DOSEN";
                    ud.status = rs.getString("status");
                    result.add(ud);
                }
                
            }
            return result;
        } catch (Exception ex) {
            return null;
        }
    }

}
