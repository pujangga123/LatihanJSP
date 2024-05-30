package kampus;

public class DosenTest {

    public static void main(String[] args) {
        Dosen dosen = new Dosen();

        // test TAMBAH
        dosen.nid = "111";
        dosen.nama = "HENDRA";
        dosen.status = "AKTIF";
        if (dosen.tambah()) {
            System.out.println("TAMBAH OK");
        } else {
            System.out.println("TAMBAH GAGAL");
            System.out.println(dosen.getErrMsg());
        }

        // test BACA
        dosen.baca("111");
        if (!dosen.nid.isEmpty()) {
            System.out.println("BACA OK");
        } else {
            System.out.println("BACA GAGAL");
            System.out.println(dosen.getErrMsg());
        }

        // test UPDATE
        dosen.nama = "HENDRA UTOMO";
        dosen.status = "NONAKTIF";
        if (dosen.update()) {
            System.out.println("UPDATE OK");
        } else {
            System.out.println("UPDATE GAGAL");
            System.out.println(dosen.getErrMsg());
        }
    }
}
