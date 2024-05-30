/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kampus;

/**
 *
 * @author Lenovo
 */
public class MahasiswaTest {
    public static void main(String[] args) {
        Mahasiswa mahasiswa = new Mahasiswa();
        
        // test TAMBAH
        mahasiswa.nim = "111";
        mahasiswa.nama = "HENDRA";
        mahasiswa.alamat = "JALAN ABC";
        if(mahasiswa.tambah()) {
            System.out.println("TAMBAH OK");
        } else {
            System.out.println(mahasiswa.getErrMsg());
        }
        
        // test BACA
        mahasiswa.baca("111");
        if(!mahasiswa.nim.isEmpty()) {
            System.out.println("BACA OK");
            System.out.println(mahasiswa.nim+" "+mahasiswa.nama+" "+mahasiswa.status);
            mahasiswa.rekalkulasiIpk();
            System.out.println("IPK: "+mahasiswa.getIpk());
        } else {
            System.out.println("BACA GAGAL");
        }
        
        // test UPDATE
        mahasiswa.nama = "HENDRA UTOMO";
        mahasiswa.alamat = "JALAN LEUWIPANJANG";
        if(mahasiswa.update()) {
            System.out.println("UPDATE OK");
        } else {
            System.out.println(mahasiswa.getErrMsg());
        }
    }
}
