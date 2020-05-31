package com.abc.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.abc.dao.InterestRateDao;
import com.abc.dao.SavingDao;
import com.abc.dao.UserDao;
import com.abc.model.InterestRate;
import com.abc.model.Saving;
import com.abc.model.User;
@Repository
public class SavingDaoImpl implements SavingDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	InterestRateDao rateDao;

	@Override
	public List<Saving> getAllSaving() {
		String sql = "SELECT * FROM saving WHERE valid=1";
		return jdbcTemplate.query(sql, new Object[] {}, new RowMapper<Saving>() {

			public Saving mapRow(ResultSet rs, int rowNum) throws SQLException {
				Saving saving= new Saving();
				saving.setId(rs.getInt("id"));
				saving.setDeposit(rs.getBigDecimal("deposit"));
				saving.setStartDate(rs.getDate("start_date"));
				saving.setInterestAsm(rs.getBigDecimal("interest_asm"));
				saving.setValid(rs.getInt("valid"));
				saving.setInterestReal(rs.getBigDecimal("interest_real"));
				saving.setEndDate(rs.getDate("end_date"));
				saving.setNumSaving(rs.getString("num_saving"));
				
				
				int id_user= rs.getInt("id_user");
				User user = new User();
				user= userDao.getUserById(id_user);
				saving.setUser(user);
				
				int id_option_insert = rs.getInt("id_option_insert");
				InterestRate rate= new InterestRate();
				rate= rateDao.getRateById(id_option_insert);
				saving.setInterestRate(rate);
				
				
				return saving;
			}
		});
	}

	@Override
	public void addSaving(Saving saving) {
		String sql = "INSERT INTO saving(id_user,id_option_insert,start_date,deposit,interest_asm,valid,interest_real,num_saving,end_date) VALUES(?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql,saving.getUser().getId(), saving.getInterestRate().getId(), saving.getStartDate(), saving.getDeposit(),
				saving.getInterestAsm(), saving.getValid(), saving.getInterestReal(), saving.getNumSaving(), saving.getEndDate());
		
	}

	@Override
	public Saving getByNumSaving(String num) {
		String sql = "SELECT * FROM saving WHERE num_saving = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { num }, new RowMapper<Saving>() {

			public Saving mapRow(ResultSet rs, int rowNum) throws SQLException {
				Saving saving= new Saving();
				saving.setId(rs.getInt("id"));
				saving.setDeposit(rs.getBigDecimal("deposit"));
				saving.setStartDate(rs.getDate("start_date"));
				saving.setInterestAsm(rs.getBigDecimal("interest_asm"));
				saving.setValid(rs.getInt("valid"));
				saving.setInterestReal(rs.getBigDecimal("interest_real"));
				saving.setEndDate(rs.getDate("end_date"));
				saving.setNumSaving(rs.getString("num_saving"));
				
				
				int id_user= rs.getInt("id_user");
				User user = new User();
				user= userDao.getUserById(id_user);
				saving.setUser(user);
				
				int id_option_insert = rs.getInt("id_option_insert");
				InterestRate rate= new InterestRate();
				rate= rateDao.getRateById(id_option_insert);
				saving.setInterestRate(rate);
				
				
				return saving;
			}
		});
	}

	@Override
	public void endSaving(Saving saving) {
		String sql = "UPDATE saving SET valid= ?, interest_real=?  WHERE id = ?";
		jdbcTemplate.update(sql,saving.getValid(), saving.getInterestReal(), saving.getId());
		
	}

	
}
