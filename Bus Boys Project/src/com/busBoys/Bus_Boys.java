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
    private JButton butHomeLogin;
    private JButton butHomeRoutes;
    private JButton butHomeRequests;
    private JButton butHomeContact;
    private JTextArea texHomeDescription;
    private JLabel lblUsername;
    private JLabel lblPassword;
    private JTextField fldUsername;
    private JPasswordField fldPassword;
    private JButton butLoginEmployee;
    private JButton butLoginAdmin;
    private JButton butLoginSupervisor;
    private JLabel lblSubmit;
    private JTextField txtStationNumberSupervised;
    private JTextField txtStationNameSupervised;
    private JTextField txtNumberOfEmployeesSupervised;
    private JLabel lblStationNumberSupervised;
    private JLabel lblStationNameSupervised;
    private JLabel lblNumberOfEmployeesSupervised;
    private JButton butSupViewBuses;
    private JLabel lblSupViewEmployees;
    private JButton butSupViewDrivers;
    private JButton butSupViewMechanics;
    private JButton butSupViewCashiers;
    private JButton butSupViewJanitors;
    private JComboBox comboBoxTaxis;
    private JButton butReqSubmit;
    private JLabel lblAvailableTaxis;
    private JLabel lblContactInfo;
    private JLabel lblConPhone;
    private JLabel lblConEmail;
    private JLabel lblConComplaint;
    private JTextArea txtAreaComplaintText;
    private JButton butConSubmitComplaint;
    private JButton butAdminDeleteVehicle;
    private JButton butAdminAddEmployee;
    private JButton butAdminDeleteEmployee;
    private JButton butAdminAddVehicle;
    private JLabel lblAdminVehicle;
    private JLabel lblAdminEmployee;

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
                //TODO query route info
                //TODO create routes dialog window
                JOptionPane.showMessageDialog(null, "Route Info");
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

        //TODO query available taxi list
        //TODO create loop to add taxi list to comboBoxTaxis like below.
        comboBoxTaxis.addItem("Taxi 1");
        comboBoxTaxis.addItem("Taxi 2");
        comboBoxTaxis.addItem("Taxi 3");
        comboBoxTaxis.addItem("Taxi 4");
        comboBoxTaxis.setSelectedIndex(0);
        //TODO add action listener to combo box list

        butReqSubmit.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO add submit functionality?
                JOptionPane.showMessageDialog(null, "Request Submitted.");
                panRequests.setVisible(false);
                panHome.setVisible(true);
            }
        });


        //-----Login Panel Listeners-------------------------------------------------------------
        butLogHome.addActionListener(new ActionListener() { //Home Button
            @Override
            public void actionPerformed(ActionEvent e) {
                panLogin.setVisible(false);
                panHome.setVisible(true);
            }
        });
        butLoginEmployee.addActionListener(new ActionListener() { //Employee Login Button
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO authentication
                //TODO query employee info
                //TODO employee info dialog window
                JOptionPane.showMessageDialog(null,"Employee Info");
            }
        });
        butLoginSupervisor.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO authentication
                //TODO query station #
                //TODO query station name
                //TODO query total # of employees
                panLogin.setVisible(false);
                panSupervisor.setVisible(true);

            }
        });
        butLoginAdmin.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                panLogin.setVisible(false);
                panAdmin.setVisible(true);
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
        butSupViewBuses.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO query buses supervised
                JOptionPane.showMessageDialog(null,"Buses Supervised");
            }
        });
        butSupViewDrivers.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO query drivers supervised
                JOptionPane.showMessageDialog(null, "Drivers Supervised");
            }
        });
        butSupViewMechanics.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO query mechanics supervised
                JOptionPane.showMessageDialog(null, "Mechanics Supervised");
            }
        });
        butSupViewCashiers.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO query cashiers supervised
                JOptionPane.showMessageDialog(null,"Cashiers Supervised");
            }
        });
        butSupViewJanitors.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO query janitors supervised
                JOptionPane.showMessageDialog(null,"Janitors Supervised");
            }
        });

        //-----Contact Panel Listeners--------------------------------------------------------------
        butConHome.addActionListener(new ActionListener() { //home button
            @Override
            public void actionPerformed(ActionEvent e) {
                panContact.setVisible(false);
                panHome.setVisible(true);
            }
        });
        butConSubmitComplaint.addActionListener(new ActionListener() { //complaint button
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO submit complaint functionality, update query?
                JOptionPane.showMessageDialog(null,"Complaint Submitted");
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

        butAdminAddVehicle.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO add vehicle functionality
                //TODO query
                JOptionPane.showMessageDialog(null,"Add Vehicle");
            }
        });
        butAdminDeleteVehicle.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO delete vehicle functionality
                //TODO delete query
                JOptionPane.showMessageDialog(null,"Delete Vehicle");

            }
        });
        butAdminAddEmployee.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO add employee functionality
                //TODO add employee query
                JOptionPane.showMessageDialog(null,"Add Employee");
            }
        });
        butAdminDeleteEmployee.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO delete employee functionality
                //TODO delete employee query
                JOptionPane.showMessageDialog(null,"Delete Employee");
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
