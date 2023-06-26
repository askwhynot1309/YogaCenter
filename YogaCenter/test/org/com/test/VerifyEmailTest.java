/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package org.com.test;

import Utils.CheckEmailExist;
import junit.framework.Assert;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author ADMIN
 */
public class VerifyEmailTest {
    
   @Test
   public void testVerifyEmil(){
       Assert.assertEquals(true, CheckEmailExist.isAddressValid("nguyencanqn123@gmail.com"));
   }
    
}
