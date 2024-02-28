package hjs;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookService {

	public void delete(Book book) {
		ConnDB connDB = new ConnDB();
		String sql = "delete from book where id='" + book.getId() + "'";
		String sql1 = "alter table book DROP id";
		String sql2 = "alter table book add id int NOT NULL FIRST";
		String sql3 = "alter table book modify column id int NOT NULL AUTO_INCREMENT,ADD PRIMARY KEY(id)";
		int result = connDB.doUpdate(sql);
		int result1 = connDB.doUpdate(sql1);
		int result2 = connDB.doUpdate(sql2);
		int result3 = connDB.doUpdate(sql3);
	}

	public void update(Book book) {
		ConnDB connDB = new ConnDB();
		String sql = "update book set name='" + book.getName() + "',author='" + book.getAuthor() + "',price="
				+ book.getPrice() + ",publishHouse='" + book.getPublishHouse() + "'where id='" + book.getId() + "'";
		int result = connDB.doUpdate(sql);
	}

	public void addBook(Book book) {
		ConnDB connDB = new ConnDB();
		String sql = "insert into book(name,author,price,publishHouse) values('" + book.getName() + "','"
				+ book.getAuthor() + "','" + book.getPrice() + "','" + book.getPublishHouse() + "')";
		int result = connDB.doUpdate(sql);
	}
	
	public void searchBook(Book book) {
		
	}
}
