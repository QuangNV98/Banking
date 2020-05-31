package com.abc.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.abc.dao.InterestRateDao;
import com.abc.model.InterestRate;
import com.abc.model.User;
@Repository
public class InterestRateImpl implements InterestRateDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<InterestRate> getAllRate() {
		String sql = "SELECT * FROM option_insert_rate";
		return jdbcTemplate.query(sql, new Object[] {}, new RowMapper<InterestRate>() {

			public InterestRate mapRow(ResultSet rs, int rowNum) throws SQLException {
				InterestRate rate = new InterestRate();
				rate.setId(rs.getInt("id"));
				rate.setPeriod(rs.getInt("period"));
				rate.setInterest_rate(rs.getFloat("interest_rate"));
				rate.setIdType(rs.getInt("id_type"));
				rate.setDayDefault(rs.getInt("day_default"));
				
				return rate;
			}
		});
	}

	@Override
	public InterestRate getRateById(int id) {
		String sql = "SELECT * FROM option_insert_rate WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new RowMapper<InterestRate>() {

			public InterestRate mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				InterestRate rate = new InterestRate();
				rate.setId(rs.getInt("id"));
				rate.setPeriod(rs.getInt("period"));
				rate.setInterest_rate(rs.getFloat("interest_rate"));
				rate.setIdType(rs.getInt("id_type"));
				rate.setDayDefault(rs.getInt("day_default"));
				
				return rate;
			}
		});
	}

	@Override
	public List<InterestRate> getListRateByIdType(int idType) {
		String sql = "SELECT * FROM option_insert_rate WHERE id_type = ?";
		return jdbcTemplate.query(sql, new Object[] {idType}, new RowMapper<InterestRate>() {

			public InterestRate mapRow(ResultSet rs, int rowNum) throws SQLException {
				InterestRate rate = new InterestRate();
				rate.setId(rs.getInt("id"));
				rate.setPeriod(rs.getInt("period"));
				rate.setInterest_rate(rs.getFloat("interest_rate"));
				rate.setIdType(rs.getInt("id_type"));
				rate.setDayDefault(rs.getInt("day_default"));
				
				return rate;
			}
		});
	}



	
}
