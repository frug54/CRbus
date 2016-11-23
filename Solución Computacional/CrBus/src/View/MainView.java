package View;

import Controller.LogInController;
import javax.swing.JPanel;


public class MainView extends javax.swing.JFrame {
    
    private static MainView obj = null;

    private MainView() {
        initComponents();
    }
    
    public static MainView getObject() {
        if (obj == null) {
            obj = new MainView();
        }
        return obj;
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 900, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 500, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                
                final int WIDTH, HEIGHT;
                HEIGHT = 500;
                WIDTH = 900;
                
                LogInView logIn = new LogInView();
                logIn.setBounds(0,0,WIDTH,HEIGHT);
                LogInController controller = new LogInController(logIn);
                MainView.getObject().getContentPane().add(logIn);
                //MainView.getObject().getContentPane().repaint();
                //MainView.getObject().getContentPane().revalidate();
                MainView.getObject().pack();
               
                /*MainView.getObject().getContentPane().removeAll();
                MainView.getObject().getContentPane().repaint();
                MainView.getObject().getContentPane().revalidate();
                            
                MainView.getObject().pack();
                
                MainView.getObject().getContentPane().add(logIn);
                MainView.getObject().getContentPane().repaint();
                MainView.getObject().getContentPane().revalidate();
                MainView.getObject().pack();*/
                
              
                MainView.getObject().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
