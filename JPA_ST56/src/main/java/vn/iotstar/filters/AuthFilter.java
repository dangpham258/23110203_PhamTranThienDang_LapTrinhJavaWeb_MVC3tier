package vn.iotstar.filters;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import vn.iotstar.entity.User;

public class AuthFilter implements Filter {

	private String cleanPath(HttpServletRequest req) {
		String p = req.getRequestURI().substring(req.getContextPath().length());
		int i = p.indexOf(';');
		return (i >= 0) ? p.substring(0, i) : p;
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		String path = cleanPath(request);

		boolean isPublic = path.equals("/login") || path.equals("/register") || path.equals("/forgot")
				|| path.startsWith("/assets/") || path.startsWith("/image");
		if (isPublic) {
			chain.doFilter(req, res);
			return;
		}

		HttpSession session = request.getSession(false);
		User auth = (session == null) ? null : (User) session.getAttribute("auth");
		if (auth == null) {
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/login"));
			return;
		}

		int role = auth.getRoleId(); // 1-user, 2-manager, 3-admin
		if (path.startsWith("/admin/") && role != 3) {
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/" + targetHome(role)));
			return;
		}
		if (path.startsWith("/manager/") && role != 2) {
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/" + targetHome(role)));
			return;
		}
		if (path.startsWith("/user/") && role != 1) {
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/" + targetHome(role)));
			return;
		}

		chain.doFilter(req, res);
	}

	private String targetHome(int role) {
		return role == 3 ? "admin/home" : role == 2 ? "manager/home" : "user/home";
	}
}
