
package kampus;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseTest {
    public static final String DBDRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String DBCONNECTION = "jdbc:mysql://localhost:3306/test";
    public static final String DBUSER = "root";
    public static final String DBPASS = "";
    
    public static Connection connect() {
        try {
            Class.forName(DBDRIVER);
            return DriverManager.getConnection(DBCONNECTION,DBUSER,DBPASS);
        }catch(Exception e) {
            return null;
        }
    }
}
