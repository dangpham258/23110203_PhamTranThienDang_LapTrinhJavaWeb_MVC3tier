package vn.iotstar.controller.category;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.iotstar.models.Category;
import vn.iotstar.models.User;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;

@WebServlet(urlPatterns = { "/admin/category/list" })
public class CategoryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final CategoryService service = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User u = (User) req.getSession().getAttribute("account");
		if (u == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		String q = req.getParameter("q");
		List<Category> list = (q == null || q.isBlank()) ? service.getAllByUser(u.getId())
				: service.searchByUser(q, u.getId());

		req.setAttribute("cateList", list);
		req.getRequestDispatcher("/views/admin/category/list.jsp").forward(req, resp);
	}
}
