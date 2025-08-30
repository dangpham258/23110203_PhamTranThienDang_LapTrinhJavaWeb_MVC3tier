package vn.iotstar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.models.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

import java.io.IOException;

/**
 * Servlet implementation class ForgotPasswordController
 */
@WebServlet("/forgot")
public class ForgotPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/forgot.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String newPassword = req.getParameter("newPassword");
        String confirm = req.getParameter("confirmPassword");

        String alert = null;

        if (username == null || email == null || newPassword == null || confirm == null
                || username.isBlank() || email.isBlank() || newPassword.isBlank() || confirm.isBlank()) {
            alert = "Vui lòng nhập đủ thông tin.";
            req.setAttribute("alert", alert);
            req.getRequestDispatcher("/forgot.jsp").forward(req, resp);
            return;
        }

        if (!newPassword.equals(confirm)) {
            alert = "Mật khẩu xác nhận không khớp.";
            req.setAttribute("alert", alert);
            req.getRequestDispatcher("/forgot.jsp").forward(req, resp);
            return;
        }

        User u = userService.get(username);
        if (u == null || !email.equalsIgnoreCase(u.getEmail())) {
            alert = "Username hoặc email không đúng.";
            req.setAttribute("alert", alert);
            req.getRequestDispatcher("/forgot.jsp").forward(req, resp);
            return;
        }

        boolean ok = userService.updatePassword(username, newPassword);
        if (ok) {
            // Có thể buộc đăng nhập lại
            req.setAttribute("alert", "Đặt lại mật khẩu thành công! Vui lòng đăng nhập.");
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            alert = "Lỗi hệ thống!";
            req.setAttribute("alert", alert);
            req.getRequestDispatcher("/forgot.jsp").forward(req, resp);
        }
    }

}
