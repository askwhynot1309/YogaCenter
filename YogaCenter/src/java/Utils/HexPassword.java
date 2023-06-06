/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author ADMIN
 */
public class HexPassword {

    public static String HexPassword(String pwd){
        String hex = DigestUtils.md5Hex(pwd).toUpperCase();
        return hex;
    }
}
