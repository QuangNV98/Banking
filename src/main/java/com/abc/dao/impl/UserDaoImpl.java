package com.abc.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.abc.dao.UserDao;
import com.abc.model.User;
@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	/*public void addUser(User user) {
		String sql = "INSERT INTO tbluser(name,sdt,username,password,role) VALUES(?,?,?,?,?)";
		jdbcTemplate.update(sql, user.getName(), user.getPhone(),user.getUsername(), user.getPassword(), user.getRole());
	}
	
	public void updateUser(User user) {
		String sql = "UPDATE tbluser SET name = ?, sdt = ?,username=?, password= ?, role = ?  WHERE id = ?";
		jdbcTemplate.update(sql, user.getName(), user.getPhone(),user.getUsername(),  user.getPassword(),user.getRole(), user.getId());
	}

	public void deleteUser(int id) {
		String sql = "DELETE FROM tbluser WHERE id = ?";
		jdbcTemplate.update(sql, id);
	}

	public User getUserById(int id) {
		String sql = "SELECT * FROM tbluser WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new RowMapper<User>() {

			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("sdt"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
				return user;
			}
		});
	}

	public User getUserByName(String name) {
		String sql = "SELECT * FROM tbluser WHERE username LIKE ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { name }, new RowMapper<User>() {

			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("sdt"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
				return user;
			}
		});
	}*/
	
	public User getUserById(int id) {
		String sql = "SELECT * FROM user WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new RowMapper<User>() {

			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("phone"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setAddress(rs.getString("address"));
				user.setEmail(rs.getString("email"));
				user.setEnable(rs.getInt("enable"));
				user.setAccount_number(rs.getString("account_number"));
				user.setId_number(rs.getString("id_number"));
				user.setDate_ranger(rs.getDate("date_ranger"));
				user.setTotal_money(rs.getBigDecimal("total_money"));
				
				return user;
			}
		});
	}
	
	public void addUser(User user) {
		String sql = "INSERT INTO user(username,password,email,phone,address,name,total_money,id_number,account_number,date_ranger) VALUES(?,?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, user.getUsername(), user.getPassword(),user.getEmail(), user.getPhone(), 
				user.getAddress(), user.getName(),user.getTotal_money(),user.getId_number(),user.getAccount_number(),user.getDate_ranger());
	}
	
	public List<User> getAllUsers() {
		String sql = "SELECT * FROM user";
		return jdbcTemplate.query(sql, new Object[] {}, new RowMapper<User>() {

			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("phone"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setAddress(rs.getString("address"));
				user.setEmail(rs.getString("email"));
				user.setEnable(rs.getInt("enable"));
				user.setAccount_number(rs.getString("account_number"));
				user.setId_number(rs.getString("id_number"));
				user.setDate_ranger(rs.getDate("date_ranger"));
				user.setTotal_money(rs.getBigDecimal("total_money"));
				
				return user;
			}
		});
	}

	@Override
	public void updateUser(User user) {
		String sql = "UPDATE user SET name= ?, phone= ?, username=?, password= ?, address=?, email=?, account_number=?, id_number=?, date_ranger=?, total_money=?  WHERE id = ?";
		jdbcTemplate.update(sql,user.getName(),user.getPhone(),user.getUsername(),user.getPassword(), user.getAddress(), user.getEmail(), user.getAccount_number(), user.getId_number(),user.getDate_ranger(),user.getTotal_money() , user.getId());
		
	}

	@Override
	public void deleteUserFlutter(int id) {
		String sql = "DELETE FROM user WHERE id = ?";
		jdbcTemplate.update(sql, id);
	}


}
