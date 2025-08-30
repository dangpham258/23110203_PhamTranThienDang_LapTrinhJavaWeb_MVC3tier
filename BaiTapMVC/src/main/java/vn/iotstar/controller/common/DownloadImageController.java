package vn.iotstar.controller.common;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.iotstar.util.Constant;

@WebServlet(urlPatterns = "/image")
public class DownloadImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String fileName = req.getParameter("fname");
		if (fileName == null || fileName.isBlank()) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		File file = new File(Constant.DIR + File.separator + fileName);
		if (!file.exists() || !file.isFile()) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		String mime = getServletContext().getMimeType(file.getName());
		if (mime == null)
			mime = "application/octet-stream";
		resp.setContentType(mime);

		// copy file ra output
		try (OutputStream out = resp.getOutputStream()) {
			Files.copy(Path.of(file.getAbsolutePath()), out);
		}
	}
}
