package hjs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class libManage
 */
@WebServlet("/libManage")
public class libManage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public libManage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String type = request.getParameter("type");
		HttpSession session = request.getSession();
		int flag = 0;
		Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getValue().equals(session.getAttribute("name"))) {
				flag = 1;
				if (type.equals("toupdate")) {
					String id = request.getParameter("id");
					session.setAttribute("id", id);
					response.sendRedirect("update.jsp");
				} else if (type.equals("update")) {
					int id = Integer.parseInt((String) session.getAttribute("id"));
					String name = request.getParameter("upname");
					String author = request.getParameter("upauthor");
					String price = request.getParameter("upprice");
					String publishHouse = request.getParameter("uppublishHouse");
					ConnDB connDB = new ConnDB();
					String sql = "select * from book where id='" + id + "'";
					ResultSet rs = connDB.doQuery(sql);
					Book book = new Book();
					try {
						if (rs.next()) {
							if (name == "") {
								book.setName(rs.getString("name"));
							} else {
								book.setName(name);
							}
							if (author == "") {
								book.setAuthor(rs.getString("author"));
							} else {
								book.setAuthor(author);
							}
							if (price == "") {
								book.setPrice(rs.getFloat("price"));
							} else {
								book.setPrice(Float.parseFloat(price));
							}
							if (publishHouse == "") {
								book.setPublishHouse(rs.getString("publishHouse"));
							} else {
								book.setPublishHouse(publishHouse);
							}
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
					out.print(price);
					book.setId(id);
					BookService bookService = new BookService();
					bookService.update(book);
					response.sendRedirect("index.jsp");
				} else if (type.equals("del")) {
					int id = Integer.parseInt(request.getParameter("id"));
					Book book = new Book();
					book.setId(id);
					BookService bookService = new BookService();
					bookService.delete(book);
					response.sendRedirect("index.jsp");
				}else if (type.equals("toadd")) {
					response.sendRedirect("addBook.jsp");
				} else if (type.equals("add")) {
					String name = request.getParameter("upname");
					String author = request.getParameter("upauthor");
					String price = request.getParameter("upprice");
					String publishHouse = request.getParameter("uppublishHouse");
					Book book = new Book();
					book.setName(name);
					book.setAuthor(author);
					book.setPrice(Float.parseFloat(price));
					book.setPublishHouse(publishHouse);
					BookService bookService = new BookService();
					bookService.addBook(book);
					response.sendRedirect("index.jsp");
				}else if (type.equals("self")) {
					response.sendRedirect("selfInfo.jsp");
				}else if (type.equals("return")) {
					response.sendRedirect("index.jsp");
				}else if (type.equals("exit")) {
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
					response.sendRedirect("login.jsp");
				}
				break;
			}
			else {
				flag = 0;
			}
		}
		if (flag==0) {
			response.sendRedirect("login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
