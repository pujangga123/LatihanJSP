
package kampus;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseTest {
    public static final String DBDRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String DBCONNECTION = "jdbc:mysql://localhost:3306/test";
    public static final String DBUSER = "root";
    public static final String DBPASS = "";
    private String errMsg = "";
    
    public static Connection connect() {
        try {
            Class.forName(DBDRIVER);
            Connection conn = DriverManager.getConnection(DBCONNECTION,DBUSER,DBPASS);
            return conn;
        }catch(Exception e) {
            return null;
        }
    }
    
    public void setErrMsg(String msg) {
        this.errMsg = msg;
    }
    
    public String getErrMsg() {
        return errMsg;
    }
}
