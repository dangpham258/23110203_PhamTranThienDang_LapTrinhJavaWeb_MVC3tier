package vn.iotstar.controllers.manager;

import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.nio.file.Paths;
import java.util.List;
import vn.iotstar.entity.*;
import vn.iotstar.services.CategoryService;
import vn.iotstar.services.impl.CategoryServiceImpl;
import vn.iotstar.util.Constant;

@WebServlet(urlPatterns = { "/manager/*" })
@MultipartConfig
public class ManagerController extends HttpServlet {
	private final CategoryService cateService = new CategoryServiceImpl();

	private String cleanPath(HttpServletRequest req) {
		String p = req.getRequestURI().substring(req.getContextPath().length());
		int i = p.indexOf(';');
		return (i >= 0) ? p.substring(0, i) : p;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = cleanPath(req);
		User me = (User) req.getSession().getAttribute("auth");

		if (path.equals("/manager/home")) {
			  User person = (User) req.getSession().getAttribute("auth");
			  String uidParam = req.getParameter("uid");
			  Integer uid;
			  try {
			    uid = (uidParam == null || uidParam.isBlank()) ? person.getId() : Integer.valueOf(uidParam);
			  } catch (NumberFormatException e) {
			    uid = person.getId();
			  }

			  List<Category> items = cateService.findByUser(uid);
			  req.setAttribute("items", items);
			  req.setAttribute("uid", uid);          // để JSP biết đang filter theo ai
			  req.getRequestDispatcher("/views/manager/home.jsp").forward(req, resp);
			  return;
			}

		if (path.equals("/manager/category/add")) {
			req.getRequestDispatcher("/views/category/form.jsp").forward(req, resp);
			return;
		}
		if (path.equals("/manager/category/edit")) {
			Integer id = Integer.valueOf(req.getParameter("id"));
			Category c = cateService.findById(id);
			if (c == null || !c.getUser().getId().equals(me.getId())) {
				resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath() + "/manager/home"));
				return;
			}
			req.setAttribute("item", c);
			req.getRequestDispatcher("/views/category/form.jsp").forward(req, resp);
			return;
		}
		if (path.equals("/manager/category/delete")) {
			Integer id = Integer.valueOf(req.getParameter("id"));
			Category c = cateService.findById(id);
			if (c != null && c.getUser().getId().equals(me.getId()))
				cateService.delete(id);
			resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath() + "/manager/home"));
			return;
		}

		resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath() + "/manager/home"));
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String path = cleanPath(req);
		User me = (User) req.getSession().getAttribute("auth");
		new File(Constant.DIR).mkdirs();

		if (path.equals("/manager/category/add")) {
			Category c = new Category();
			c.setName(req.getParameter("name"));
			c.setUser(me);
			Part p = req.getPart(Constant.FILE_PARAM);
			if (p != null && p.getSize() > 0) {
				String fn = System.currentTimeMillis() + "_"
						+ Paths.get(p.getSubmittedFileName()).getFileName().toString();
				p.write(Constant.DIR + File.separator + fn);
				c.setImage(fn);
			}
			cateService.insert(c);
			resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath() + "/manager/home"));
			return;
		}

		if (path.equals("/manager/category/edit")) {
			Integer id = Integer.valueOf(req.getParameter("id"));
			Category c = cateService.findById(id);
			if (c == null || !c.getUser().getId().equals(me.getId())) {
				resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath() + "/manager/home"));
				return;
			}
			c.setName(req.getParameter("name"));
			Part p = req.getPart(Constant.FILE_PARAM);
			if (p != null && p.getSize() > 0) {
				String fn = System.currentTimeMillis() + "_"
						+ Paths.get(p.getSubmittedFileName()).getFileName().toString();
				p.write(Constant.DIR + File.separator + fn);
				c.setImage(fn);
			}
			cateService.update(c);
			resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath() + "/manager/home"));
			return;
		}

		resp.sendError(404);
	}
}
