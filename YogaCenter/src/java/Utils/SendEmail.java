package Utils;

import java.util.Properties;
import javax.mail.Authenticator;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

    private static final String SENDER_EMAIL = "t4ikhoancuaquyen4@gmail.com"; // Your Gmail address
    private static final String SENDER_PASSWORD = "nfrgzjaptuxxpywx"; // Your Gmail app password

    public static void main(String[] args) {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

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
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("tommarvoloriddle1975@gmail.com"));
            message.setSubject("Password Reset OTP");
            message.setText("Your OTP for password reset is: " + "123");
            // Send message
            Transport.send(message);
            System.out.println("run ok ");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
