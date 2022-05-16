package springbook.user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import springbook.user.domain.User;

public class UserDao {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        UserDao dao = new UserDao();

        User user = new User();
        user.setId("mistcloud");
        user.setName("yujuhun");
        user.setPassword("hello");

        dao.add(user);
        System.out.println(user.getId() + "success registration");

        User user2 = dao.get(user.getId());
        System.out.println(user2.getName());
        System.out.println(user2.getPassword());

        System.out.println(user2.getId() + "success inqury");
    }

    public void add(User user) throws ClassNotFoundException, SQLException { // Throws exception
        Class.forName("com.mysql.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/springbook", "root", "1234");        
        // Get Connection

        PreparedStatement ps = c.prepareStatement( // Create & Run PS 
            "insert into users(id, name, password) values(?,?,?)");
            ps.setString(1, user.getId());   
            ps.setString(2, user.getName());
            ps.setString(3, user.getPassword());
            // Move to data

            ps.executeUpdate();

            ps.close();
            c.close();
            // closed work 
    }

    public User get(String id) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/springbook", "root", "1234");        
        // Get Connection

        PreparedStatement ps = c.prepareStatement(
            "select * from users where id = ?");
        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();
        rs.next();
        User user = new User();
        user.setId(rs.getString("id"));
        user.setName(rs.getString("name"));
        user.setPassword(rs.getString("password"));

        rs.close();
        ps.close();
        c.close();

        return user;
    }

}


