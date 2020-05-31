package com.abc.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.abc.dao.PercentDao;
import com.abc.dao.UserDao;
import com.abc.model.PercentInteresrt;
import com.abc.model.User;
@Repository
public class PercentDaoImpl implements PercentDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	

	
	
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





	@Override
	public PercentInteresrt getPercentByName(String type) {
		String sql = "SELECT * FROM default_insert_rate WHERE type = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { type }, new RowMapper<PercentInteresrt>() {

			public PercentInteresrt mapRow(ResultSet rs, int rowNum) throws SQLException {
				PercentInteresrt percent = new PercentInteresrt();
				percent.setId(rs.getInt("id"));
				percent.setType(rs.getString("type"));
				percent.setPercent(rs.getFloat("percent"));
				
				return percent;
			}
		});
	}
	
	
}
