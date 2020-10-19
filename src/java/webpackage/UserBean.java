/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webpackage;


public class UserBean {
    private String uname;
    private String message;
    private String mobile;
    private String uemail;
    
    
    public void setUserName(String name) {
        uname = name;
    }
    
    public String getUserName() {
        return uname;
    }
    
    public void setMessage(String text) {
        message = text;
    }
    
    public String getMessage() {
        return message;
    }
    
    public void setMobile(String no) {
        mobile = no;
    }
    
    public String getMobile() {
        return mobile;
    }
    
    public void setEmail(String mail) {
        uemail = mail;
    }
    
    public String getEmail() {
        return uemail;
    }
}
