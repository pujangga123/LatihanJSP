/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kampus;

/**
 *
 * @author En Tay
 */
public class Karyawan extends Mahasiswa {
    
    private int score;
    
    public int getScore() {
        return this.score;
    }
    
    public void rekalkulasiScore() {
       this.score = (int) Math.round(super.getIpk() * 100 / 4);
    }
    
    
    
    
    
}
