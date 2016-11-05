/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.GET;

/**
 *
 * @author Aknur
 */
public class User {
    
    private Connection connection;
    private int id;
    private String fullName;
    private int pin;
    private int balance;
    private int cardNumber;
    private boolean logged;
    
    public User(){
        
        try{
            
            Class.forName("org.postgresql.Driver");
            
        }catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        connection = null;        
        try {
            
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/atm", "postgres", "mikael");
            
        } catch (Exception e) {
        }
        
    }

    public Connection getConnection() {
        return connection;
    }

    public int getBalance() {
        return balance;
    }

    public int getCardNumber() {
        return cardNumber;
    }

    public String getFullName() {
        return fullName;
    }

    public int getId() {
        return id;
    }

    public int getPin() {
        return pin;
    }
    
    public boolean getLogged(){
        return logged;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }
    
    public void setBalance(int balance) {
        this.balance = balance;
    }

    public void setCardNumber(int cardNumber) {
        this.cardNumber = cardNumber;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPin(int pin) {
        this.pin = pin;
    }
    
    public void setLogged(boolean logged){
        this.logged = logged;
    }
    
    public boolean enter( String full_name, String pin ) throws SQLException{
    
        boolean result = false;
        
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM users WHERE full_name='"+ full_name +"' AND pin="+ pin +" ");
        
        if( rs.next() ){
        
            result = true;
            this.id = Integer.parseInt( rs.getString("id") );
            this.fullName = rs.getString("full_name");
            this.pin = Integer.parseInt( rs.getString("pin") );
            this.balance = Integer.parseInt( rs.getString("balance") );
            this.cardNumber = Integer.parseInt( rs.getString("card_number") );
            this.logged = true;
                        
        }
        st.close();
        return result;
        
    }
    
}
