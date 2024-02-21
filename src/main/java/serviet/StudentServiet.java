package serviet;

import controller.ConnectionDB;
import model.Address;
import model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentServiet {
    public static Connection connection = ConnectionDB.getConnection();
    public AddressServ addressServ = new AddressServ();


    public List<Student> showList() throws SQLException {
        List<Student> studentList = new ArrayList<>();
        PreparedStatement statement = connection.prepareStatement("select * from student;");
//        // tra ve thong tin
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            int age = rs.getInt("age");

            //lay thong tin o bang address
           int add_id = rs.getInt("addressid");
           String address = addressServ.getAddressByID(add_id).getName();

            Student student = new Student(id, name, age, address);
            studentList.add(student);
        }
        return studentList;
    }
    public static void insertStudentToDataBase(Student student) {
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement("insert into hanghoa1 (id, name, age, address) values (?,?,?,?);");
            statement.setInt(1,student.getId());
            statement.setString(2,student.getName());
            statement.setInt(3,student.getAge());
            statement.setString(4,student.getAddress());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
