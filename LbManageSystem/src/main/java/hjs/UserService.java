package hjs;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {
	public boolean cheakUser(User user) throws SQLException {
		ConnDB connDB = new ConnDB();
		String sql = "select * from user where username='" + user.getName() + "'and password='" + user.getPwd() + "'";
		ResultSet rs = connDB.doQuery(sql);
		if (rs.next()) {
			user.setId(rs.getInt(1));
			user.setSex(rs.getString(4));
			user.setTel(rs.getString(5));
			user.setEmail(rs.getString(6));

			return true;
		} else {
			return false;
		}
	}

	public void insert(User user) {
		ConnDB connDB = new ConnDB();
		String sql = "insert into user(username,password,sex,tel,email) values('" + user.getName() + "','"
				+ user.getPwd() + "','" + user.getSex() + "','" + user.getTel() + "','" + user.getEmail() + "')";
		int result = connDB.doUpdate(sql);
	}
}
