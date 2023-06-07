/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Utils;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ArrayList<Get30SlotsByCourse> list = Get30SlotsByCourse.get30Slots(new Date(System.currentTimeMillis()), 10, 1);
        for (Get30SlotsByCourse get30SlotsByCourse : list) {
            System.out.println(get30SlotsByCourse);
        }
    }
    
}
