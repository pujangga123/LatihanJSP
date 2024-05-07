/*
    Class Dosen.java
    gunakan file ini sebagai template standar Class dengan tambah & update
 */
package kampus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Dosen {

    public String nid;
    public String nama;
    public String status;
    private String errMsg = "";

    public Dosen() {
        this.nid = "";
        this.nama = "";
        this.status = "NONAKTIF";
    }

    public boolean baca(String nid) {
        Connection connection = null;
        ResultSet rs = null;

        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // 1. sesuaikan string SQL
                String sql = "SELECT * FROM dosen where nid=?";
                PreparedStatement st = connection.prepareStatement(sql);

                // 2. sesuaikan parameter
                st.setString(1, nid);
                rs = st.executeQuery();

                if (rs.next()) {
                    //3. isi property dengan data yang dibaca dari database
                    this.nid = rs.getString("nid");
                    this.nama = rs.getString("nama");
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

    public boolean tambah() {
        Connection connection = null;

        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // 1. sesuaikan string SQL
                String sql = "INSERT INTO dosen (nid,nama,status) values (?,?,?)";
                PreparedStatement st = connection.prepareStatement(sql);

                // 2. sesuaikan parameter
                st.setString(1, this.nid);
                st.setString(2, this.nama);
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

    public boolean update() {
        Connection connection = null;
        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // 1. sesuaikan string SQL
                String sql = "UPDATE dosen SET nama=?, status=? WHERE nid=?";
                PreparedStatement st = connection.prepareStatement(sql);

                // 2. sesuaikan parameter
                st.setString(1, this.nama);
                st.setString(2, this.status);
                st.setString(3, this.nid);

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

    public String getErrMsg() {
        return this.errMsg;
    }

}
