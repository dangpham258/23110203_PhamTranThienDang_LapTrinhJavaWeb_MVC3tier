package vn.iotstar.controller.category;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.iotstar.models.Category;
import vn.iotstar.models.User;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.util.Constant;

@WebServlet(urlPatterns = { "/admin/category/add" })
@MultipartConfig
public class CategoryAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final CategoryService service = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User u = (User) req.getSession().getAttribute("account");
		if (u == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		req.getRequestDispatcher("/views/admin/category/add-category.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		User u = (User) req.getSession().getAttribute("account");
		if (u == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		String name = req.getParameter("name");
		Part iconPart = req.getPart("icon");

		String relPath = null;
		if (iconPart != null && iconPart.getSize() > 0) {
			String submitted = Path.of(iconPart.getSubmittedFileName()).getFileName().toString();
			String ext = "";
			int dot = submitted.lastIndexOf('.');
			if (dot >= 0)
				ext = submitted.substring(dot); 
			String fileName = System.currentTimeMillis() + ext;

			File dir = new File(Constant.DIR + File.separator + "category");
			if (!dir.exists())
				dir.mkdirs();

			File target = new File(dir, fileName);
			iconPart.write(target.getAbsolutePath());

			relPath = "category" + File.separator + fileName;
		}

		Category c = new Category();
		c.setName(name);
		c.setIcon(relPath);
		c.setUserId(u.getId());

		service.insert(c);
		resp.sendRedirect(req.getContextPath() + "/admin/category/list");
	}
}
