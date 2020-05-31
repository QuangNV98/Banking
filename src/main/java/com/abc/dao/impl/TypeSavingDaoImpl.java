package com.abc.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.abc.dao.TypeSavingDao;
import com.abc.model.TypeSaving;
@Repository
public class TypeSavingDaoImpl implements TypeSavingDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<TypeSaving> getAllTypes() {
		String sql = "SELECT * FROM type_saving";
		return jdbcTemplate.query(sql, new Object[] {}, new RowMapper<TypeSaving>() {

			public TypeSaving mapRow(ResultSet rs, int rowNum) throws SQLException {
				TypeSaving type = new TypeSaving();
				type.setId(rs.getInt("id"));
				type.setNameSaving(rs.getString("name_saving"));
				type.setStartDate(rs.getDate("start_date"));
				type.setEndDate(rs.getDate("end_date"));
				type.setDesc(rs.getString("desc"));
				
				return type;
			}
		});
	}

	@Override
	public TypeSaving getTypeById(int id) {
		String sql = "SELECT * FROM type_saving WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new RowMapper<TypeSaving>() {

			public TypeSaving mapRow(ResultSet rs, int rowNum) throws SQLException {
				TypeSaving type = new TypeSaving();
				type.setId(rs.getInt("id"));
				type.setNameSaving(rs.getString("name_saving"));
				type.setStartDate(rs.getDate("start_date"));
				type.setEndDate(rs.getDate("end_date"));
				type.setDesc(rs.getString("desc"));
				
				return type;
			}
		});
	}
}
