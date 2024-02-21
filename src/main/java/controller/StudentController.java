package controller;

import model.Student;
import serviet.StudentServiet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/student")
public class StudentController extends HttpServlet {
    StudentServiet studentServiet = new StudentServiet();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(req, resp);
                break;
            default:
                try {
                    findAllCustomer(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
        }


    }

    // lay du lieu tu create.jsp
    private void insertStudent(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String address = req.getParameter("address");
        Student student = new Student(id, name, age, address);
        StudentServiet.insertStudentToDataBase(student);
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("student/create.jsp");
        dispatcher.forward(req, resp);
    }

    public void findAllCustomer(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("student/list.jsp");
        List<Student> studentList = studentServiet.showList();
        req.setAttribute("list", studentList);
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    insertStudent(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }
}
