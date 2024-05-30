/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kampus;

/**
 *
 * @author Lenovo
 */
public class KaryawanTest {
    public static void main(String[] args) {
        Karyawan pelajar = new Karyawan();
        
        // test TAMBAH
        pelajar.nim = "222";
        pelajar.nama = "GUNAWAN";
        pelajar.alamat = "JALAN ABC";
        if(pelajar.tambah()) {
            System.out.println("TAMBAH OK");
        } else {
            System.out.println(pelajar.getErrMsg());
        }
        
        // test BACA
        pelajar.baca("222");
        if(!pelajar.nim.isEmpty()) {
            System.out.println("BACA OK");
            System.out.println(pelajar.nim+" "+pelajar.nama+" "+pelajar.status);
            System.out.println("Rekalkulasi");
            pelajar.rekalkulasiIpk();
            pelajar.rekalkulasiScore();
            System.out.println("Score " + pelajar.getScore());
        } else {
            System.out.println("BACA GAGAL");
        }
        
        // test UPDATE
        pelajar.nama = "GUNAWAN UTOMO";
        pelajar.alamat = "JALAN LEUWIPANJANG";
        if(pelajar.update()) {
            System.out.println("UPDATE OK");
        } else {
            System.out.println(pelajar.getErrMsg());
        }
    }
}
