package Utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class EmailUtils {

    private static final String SENDER_EMAIL = "nguyencanqn123@gmail.com"; // Your Gmail address
    private static final String SENDER_PASSWORD = "nfvmjequdqklpqmd"; // Your Gmail app password

    public static void sendOtpEmail(String recipientEmail, String otp) {
        // Email properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.3");

        // Session
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        try {
            // Create message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Password Reset OTP");
            message.setText("Your OTP for password reset is: " + otp);

            // Send message
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    // set default to 1
    public static String generateOtp() {
        // Generate a 6-digit OTP
        Random random = new Random();
        int otpValue = 100000 + random.nextInt(700000);
        return String.valueOf(otpValue);
    }

    public static void sendToDedicatedEmail(String emailAddress, String name, String feedback) {
        // Email properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.3");
        String email = "nguyencanqn123@gmail.com";
        String subject = "User Feedback";

        String emailBody = "From: " + emailAddress + "\n";
        emailBody += "Username: " + name + "\n";
        emailBody += "Feedback: " + feedback;
        
        // Session
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        try {
            // Create message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject(subject);
            message.setText(emailBody);

            // Send message
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
