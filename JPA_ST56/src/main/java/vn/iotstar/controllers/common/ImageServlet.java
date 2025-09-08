package vn.iotstar.controllers.common;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import vn.iotstar.util.Constant;

@WebServlet(urlPatterns = "/image")
public class ImageServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String fname = req.getParameter("fname");
		if (fname == null) {
			resp.setStatus(404);
			return;
		}
		File f = new File(Constant.DIR, fname);
		if (!f.exists()) {
			resp.setStatus(404);
			return;
		}

		resp.setContentType(getServletContext().getMimeType(fname));
		try (OutputStream os = resp.getOutputStream(); FileInputStream fis = new FileInputStream(f)) {
			fis.transferTo(os);
		}
	}
}
