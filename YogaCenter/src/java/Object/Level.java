/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Object;

import java.io.Serializable;

/**
 *
 * @author ADMIN
 */
public class Level implements Serializable{
    private int IdLevel;
    private String Level_Name;

    public Level() {
    }

    public Level(int Id_Level, String Levle_Name) {
        this.IdLevel = Id_Level;
        this.Level_Name = Levle_Name;
    }

    public int getIdLevel() {
        return IdLevel;
    }

    public void setIdLevel(int IdLevel) {
        this.IdLevel = IdLevel;
    }

    public String getLevel_Name() {
        return Level_Name;
    }

    public void setLevel_Name(String Level_Name) {
        this.Level_Name = Level_Name;
    }

    
    
}
