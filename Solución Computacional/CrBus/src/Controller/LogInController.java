package Controller;

import View.LogInView;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class LogInController implements ActionListener{
    
    private LogInView logInView;
    
    
    public LogInController(LogInView logInView) {
        this.logInView = logInView;
        this.logInView.logIn.addActionListener(this);
    }
    
    public void actionPerformed(ActionEvent e){
	System.out.println("Event");
    }
    
}
