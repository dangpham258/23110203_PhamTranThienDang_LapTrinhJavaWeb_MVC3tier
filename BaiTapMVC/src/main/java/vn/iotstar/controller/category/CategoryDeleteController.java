package vn.iotstar.controller.category;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.iotstar.models.User;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;

@WebServlet(urlPatterns = { "/admin/category/delete" })
public class CategoryDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final CategoryService service = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User u = (User) req.getSession().getAttribute("account");
		if (u == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		int id = Integer.parseInt(req.getParameter("id"));
		service.delete(id, u.getId());
		resp.sendRedirect(req.getContextPath() + "/admin/category/list");
	}
}
