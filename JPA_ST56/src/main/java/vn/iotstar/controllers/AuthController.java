package vn.iotstar.controllers;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import vn.iotstar.entity.User;
import vn.iotstar.services.UserService;
import vn.iotstar.services.impl.UserServiceImpl;

@WebServlet(urlPatterns = { "/login", "/register", "/forgot", "/logout" })
public class AuthController extends HttpServlet {
	private final UserService userService = new UserServiceImpl();

	private String cleanPath(HttpServletRequest req) {
		String p = req.getRequestURI().substring(req.getContextPath().length());
		int i = p.indexOf(';');
		return (i >= 0) ? p.substring(0, i) : p;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = cleanPath(req);
		if (path.equals("/login")) {
			req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
			return;
		}
		if (path.equals("/register")) {
			req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
			return;
		}
		if (path.equals("/forgot")) {
			req.getRequestDispatcher("/views/auth/forgot.jsp").forward(req, resp);
			return;
		}
		if (path.equals("/logout")) {
			req.getSession().invalidate();
			resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath() + "/login"));
			return;
		}
		resp.sendError(404);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String path = cleanPath(req);

		if (path.equals("/login")) {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String roleParam = req.getParameter("role");
			Integer roleId = (roleParam != null) ? Integer.valueOf(roleParam) : 1;
			
			User u = userService.login(username, password);

			if (u == null) {
				req.setAttribute("alert", "Sai tài khoản hoặc mật khẩu!");
				req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
				return;
			}
			
			// Kiểm tra vai trò có khớp không
			if (!u.getRoleId().equals(roleId)) {
				req.setAttribute("alert", "Vai trò không khớp với tài khoản!");
				req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
				return;
			}
			
			req.getSession(true).setAttribute("auth", u);
			String home = (u.getRoleId() == 3) ? "/admin/home" : (u.getRoleId() == 2) ? "/manager/home" : "/user/home";
			resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath() + home));
			return;
		}

		if (path.equals("/register")) {
			User u = new User();
			u.setUsername(req.getParameter("username"));
			u.setPassword(req.getParameter("password"));
			u.setFullName(req.getParameter("fullName"));
			u.setEmail(req.getParameter("email"));
			u.setRoleId(1);
			if (!userService.register(u)) {
				req.setAttribute("alert", "Username đã tồn tại!");
				req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
				return;
			}
			resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath() + "/login"));
			return;
		}

		if (path.equals("/forgot")) {
			boolean ok = userService.resetPassword(req.getParameter("username"), req.getParameter("newPassword"));
			req.setAttribute("alert", ok ? "Đổi mật khẩu thành công!" : "Không tìm thấy tài khoản!");
			req.getRequestDispatcher("/views/auth/forgot.jsp").forward(req, resp);
			return;
		}

		resp.sendError(404);
	}
}
