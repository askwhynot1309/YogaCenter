/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import com.google.i18n.phonenumbers.NumberParseException;
import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.google.i18n.phonenumbers.Phonenumber;

/**
 *
 * @author ADMIN
 */
public class CheckValidation {

    public static boolean checkPhone(String phone) {
        boolean isValidNumber = false;
        PhoneNumberUtil phoneNumberUtil = PhoneNumberUtil.getInstance();
        try {
            Phonenumber.PhoneNumber parsedPhoneNumber = phoneNumberUtil.parse(phone, "VN");
            isValidNumber = phoneNumberUtil.isValidNumberForRegion(parsedPhoneNumber, "VN");
        } catch (NumberParseException e) {
            System.out.println("Error parsing phone number: " + e.toString());
        }
        return isValidNumber;
    }
    
    public static boolean isValidCCCD(String idCard) {
        int length = idCard.length();
        if (length != 9 && length != 12) {
            return false;
        }
        for (int i = 0; i < idCard.length(); i++) {
        if (!Character.isDigit(idCard.charAt(i))) {
            return false;
        }
    }
        return true;
    }
    
}
