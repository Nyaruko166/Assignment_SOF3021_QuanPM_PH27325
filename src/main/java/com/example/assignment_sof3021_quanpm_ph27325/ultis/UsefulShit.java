package com.example.assignment_sof3021_quanpm_ph27325.ultis;

import org.springframework.stereotype.Component;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Component
public class UsefulShit {

    public String randomPass(int n) {

        String chuoiKyTuProVjp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < n; i++) {
            int index = (int) (chuoiKyTuProVjp.length() * Math.random());
            sb.append(chuoiKyTuProVjp.charAt(index));
        }

        return sb.toString();
    }

    public void sendEmail(String mailNguoiNhan, String newPass) {
        String from = "quanpm166@gmail.com";


        Properties prop = System.getProperties();

        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS

        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("quanpm166@gmail.com", "oabbejqeuldsqbyd");
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipients(Message.RecipientType.TO, String.valueOf(new InternetAddress(mailNguoiNhan)));
            message.setSubject("Mật khẩu mới", "utf-8");
            message.setText("Mật khẩu mới của bạn là: " + newPass, "utf-8");
//            Transport transport = session.getTransport("smtp");
//            transport.connect("smtp.gmail.com", 465, "quanpm166@gmail.com", "bkffngbxwgymwisz");
//            transport.sendMessage(message, message.getAllRecipients());
            Transport.send(message);
            System.out.println("Message sent successfully...");

        } catch (MessagingException me) {
            me.printStackTrace();
        }
    }

//    public static void main(String[] args) {
//        UsefulShit usefulShit = new UsefulShit();
//        System.out.println(usefulShit.randomPass(10));
//    }

}
