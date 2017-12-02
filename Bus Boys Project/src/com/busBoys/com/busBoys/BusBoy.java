package com.busBoys;

import javax.swing.*;

/**
 * Created by thowar9 on 12/1/2017.
 */
public class BusBoy {
    private JPanel panel1;
    private JPanel panHome;
    private JPanel panRequests;
    private JPanel panLogin;
    private JPanel panSupervisor;
    private JPanel panAdmin;
    private JPanel panContact;
    private JButton homeButton;
    private JButton homeButton1;
    private JButton homeButton2;
    private JButton homeButton3;
    private JButton homeButton4;
    private JButton homeButton5;
    private JTextField descriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionTextField;
    private JTextField descriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionTextField1;
    private JTextField descriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionTextField2;
    private JButton employeeLoginButton;
    private JButton routesButton;
    private JButton requestsButton;
    private JButton contactUsButton;

    public static void main(String[] args) {
        JFrame frame = new JFrame("BusBoy");
        frame.setContentPane(new BusBoy().panel1);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setVisible(true);
    }
}
