package kampus;

import java.util.List;

public class UsersMahasiswaTest {
    
    public static void main(String[] args) {
        UsersMahasiswa um = new UsersMahasiswa();

        // test TAMBAH
        um.id = "111";
        um.tipe = "DOSEN";
        um.status = "AKTIF";
        if (um.tambah()) {
            System.out.println("TAMBAH OK");
        } else {
            System.out.println("TAMBAH GAGAL");
            System.out.println(um.getErrMsg());
        }

        // test BACA
        um.baca("111");
        if (!um.id.isEmpty()) {
            System.out.println("BACA OK");
        } else {
            System.out.println("BACA GAGAL");
            System.out.println(um.getErrMsg());
        }

        // test UPDATE
        um.status = "NONAKTIF";
        if (um.update()) {
            System.out.println("UPDATE OK");
        } else {
            System.out.println("UPDATE GAGAL");
            System.out.println(um.getErrMsg());
        }
        
        // catak list
        System.out.println("==============================");
        List<UsersMahasiswa> daftar = UsersMahasiswa.getList();
        for(UsersMahasiswa m: daftar) {
            System.out.println(m.id+" "+m.getNama());
        }
    }

    
}
