package View;

import Controller.LogInController;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;

public class LogInView extends javax.swing.JPanel {
   
    
    public LogInView() {
        initComponents();
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        labelUser = new javax.swing.JLabel();
        logIn = new javax.swing.JButton();
        labelUsuario = new javax.swing.JLabel();
        backGround = new javax.swing.JLabel();
        user = new javax.swing.JTextField();
        password = new javax.swing.JPasswordField();

        setBackground(new java.awt.Color(0, 153, 255));
        setLayout(null);

        labelUser.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        labelUser.setForeground(new java.awt.Color(255, 255, 255));
        labelUser.setText("Usuario");
        add(labelUser);
        labelUser.setBounds(80, 150, 47, 17);

        logIn.setBackground(new java.awt.Color(0, 0, 204));
        logIn.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        logIn.setForeground(new java.awt.Color(255, 255, 255));
        logIn.setText("LogIn");
        add(logIn);
        logIn.setBounds(30, 320, 150, 30);

        labelUsuario.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        labelUsuario.setForeground(new java.awt.Color(255, 255, 255));
        labelUsuario.setText("Password");
        add(labelUsuario);
        labelUsuario.setBounds(80, 220, 56, 17);

        backGround.setIcon(new javax.swing.ImageIcon(getClass().getResource("/ImagesApp/LogIn.JPG"))); // NOI18N
        add(backGround);
        backGround.setBounds(204, -6, 750, 510);
        add(user);
        user.setBounds(30, 180, 150, 30);
        add(password);
        password.setBounds(30, 250, 150, 30);
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel backGround;
    private javax.swing.JLabel labelUser;
    private javax.swing.JLabel labelUsuario;
    public javax.swing.JButton logIn;
    public javax.swing.JPasswordField password;
    public javax.swing.JTextField user;
    // End of variables declaration//GEN-END:variables
}
