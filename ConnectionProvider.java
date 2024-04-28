package Project;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.*;

public class ConnectionProvider {
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
			return con;
		}
		catch(Exception e) {
			System.out.print(e);
			return null;
		}
	}

}
