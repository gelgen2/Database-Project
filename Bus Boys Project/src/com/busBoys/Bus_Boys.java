package com.busBoys;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Bus_Boys {
    private JPanel panel1;

    private JPanel panHome;
    private JPanel panRequests;
    private JPanel panLogin;
    private JPanel panSupervisor;
    private JPanel panContact;
    private JPanel panAdmin;

    private JLabel lblHome;
    private JLabel lblRequests;
    private JLabel lblLogin;
    private JLabel lblSupervisor;
    private JLabel lblContact;
    private JLabel lblAdmin;

    private JButton butReqHome;
    private JButton butLogHome;
    private JButton butSupHome;
    private JButton butConHome;
    private JButton butAdmHome;
    private JButton PLACEHOLDERButton;
    private JButton butHomeLogin;
    private JButton butHomeRoutes;
    private JButton butHomeRequests;
    private JButton butHomeContact;
    private JTextArea texHomeDescription;
    private JLabel lblUsername;
    private JLabel lblPassword;
    private JTextField fldUsername;
    private JPasswordField fldPassword;
    private JButton button1;
    private JButton button2;
    private JButton button3;

    public Bus_Boys() {
        //Initially set all panels invisible except home.
        panHome.setVisible(true);
        panRequests.setVisible(false);
        panAdmin.setVisible(false);
        panContact.setVisible(false);
        panLogin.setVisible(false);
        panSupervisor.setVisible(false);

        //So description text will wrap.
        texHomeDescription.setLineWrap(true);
        texHomeDescription.append("Description"); //TODO<<DESCRIPTION GOES HERE

        //Label Font Size
        String titleFont = "Times New Roman";
        lblHome.setFont(new Font(titleFont, Font.PLAIN, 30));
        lblAdmin.setFont(new Font(titleFont, Font.PLAIN, 30));
        lblRequests.setFont(new Font(titleFont, Font.PLAIN, 30));
        lblContact.setFont(new Font(titleFont, Font.PLAIN, 30));
        lblSupervisor.setFont(new Font(titleFont, Font.PLAIN, 30));
        lblLogin.setFont(new Font(titleFont, Font.PLAIN, 30));

        //-----Home Panel Listeners-------------------------------------------------------------
        butHomeLogin.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                panHome.setVisible(false);
                panLogin.setVisible(true);
            }
        });
        butHomeRoutes.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO create routes dialog window
            }
        });
        butHomeRequests.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                panHome.setVisible(false);
                panRequests.setVisible(true);
            }
        });
        butHomeContact.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                panHome.setVisible(false);
                panContact.setVisible(true);
            }
        });

        //-----Request Panel Listeners----------------------------------------------------------
        butReqHome.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                panRequests.setVisible(false);
                panHome.setVisible(true);
            }
        });

        //-----Login Panel Listeners-------------------------------------------------------------
        butLogHome.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                panLogin.setVisible(false);
                panHome.setVisible(true);
            }
        });

        //-----Supervisor Panel Listeners----------------------------------------------------------
        butSupHome.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                panSupervisor.setVisible(false);
                panHome.setVisible(true);
            }
        });

        //-----Contact Panel Listeners--------------------------------------------------------------
        butConHome.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                panContact.setVisible(false);
                panHome.setVisible(true);
            }
        });

        //-----Admin Panel Listeners---------------------------------------------------------------
        butAdmHome.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                panAdmin.setVisible(false);
                panHome.setVisible(true);
            }
        });
    }




    public static void main(String[] args) {
        JFrame frame = new JFrame("Bus_Boys");
        frame.setContentPane(new Bus_Boys().panel1);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setVisible(true);
    }
}
