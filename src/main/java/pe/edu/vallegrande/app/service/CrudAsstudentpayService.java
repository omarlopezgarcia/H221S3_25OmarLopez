package pe.edu.vallegrande.app.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.app.db.AccesoDB;
import pe.edu.vallegrande.app.model.Asstudentpay;
import pe.edu.vallegrande.app.service.spec.CrudServiceSpec;
import pe.edu.vallegrande.app.service.spec.RowMapper;

public class CrudAsstudentpayService implements CrudServiceSpec<Asstudentpay>, RowMapper<Asstudentpay> {

	private final String SQL_SELECT_ACTIVE = "SELECT * FROM asstudentpay_debt";
	private final String SQL_SELECT_INACTIVE = "SELECT * FROM asstudentpay_cancelled";
	private final String SQL_INSERT = "INSERT INTO asstudentpay (amount, asstudent_identifier, duty_identifier) VALUES (?,?,?)";
	private final String SQL_UPDATE = "UPDATE asstudentpay SET amount=?, asstudent_identifier=?, duty_identifier=? WHERE identifier=?";
	private final String SQL_DELETE = "UPDATE asstudentpay SET active='C' WHERE identifier=?";
	private final String SQL_RESTORE = "UPDATE asstudentpay SET active='D' WHERE identifier=?";
	private final String SQL_ELIMINATE = "DELETE FROM asstudentpay WHERE identifier=?";

	@Override
	public List<Asstudentpay> getActive() {
		List<Asstudentpay> lista = new ArrayList<>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs;
		try {
			cn = AccesoDB.getConnection();
			pstm = cn.prepareStatement(SQL_SELECT_ACTIVE);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Asstudentpay bean = mapRow(rs);
				lista.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}

	@Override
	public List<Asstudentpay> getInactive() {
		List<Asstudentpay> lista = new ArrayList<>();
		try (Connection cn = AccesoDB.getConnection();
				PreparedStatement pstm = cn.prepareStatement(SQL_SELECT_INACTIVE);
				ResultSet rs = pstm.executeQuery();) {
			while (rs.next()) {
				Asstudentpay bean = mapRow(rs);
				lista.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}

	@Override
	public Asstudentpay getForId(String identifier) {
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Asstudentpay bean = null;
		String sql;
		try {
			cn = AccesoDB.getConnection();
			sql = SQL_SELECT_ACTIVE + " WHERE identifier=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, Integer.parseInt(identifier));
			rs = pstm.executeQuery();
			if(rs.next()) {
				bean = mapRow(rs);
			}
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException();
		} finally {
			try {
				cn.close();
			} catch (Exception e2) {
			}
		}
		return bean;
	}

	@Override
	public List<Asstudentpay> get(Asstudentpay bean) {
		Connection cn = null;
		List<Asstudentpay> lista = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Asstudentpay item;
		String asstudent_identifier, duty_identifier, sql;
		asstudent_identifier = "%" + UtilService.setStringVacio(bean.getAsstudent_identifier()) + "%";
		duty_identifier = "%" + UtilService.setStringVacio(bean.getDuty_identifier()) + "%";
		try {
			cn = AccesoDB.getConnection();
			sql = SQL_SELECT_ACTIVE + " WHERE asstudent_identifier LIKE ? AND duty_identifier LIKE ?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, asstudent_identifier);
			pstm.setString(2, duty_identifier);
			rs = pstm.executeQuery();
			while(rs.next()) {
				item = mapRow(rs);
				lista.add(item);
			}
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException();
		} finally {
			try {
				cn.close();
			} catch (Exception e2) {
			}
		}
		return lista;
	}

	@Override
	public void insert(Asstudentpay bean) {
		Connection cn = null;
		PreparedStatement pstm = null;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			pstm = cn.prepareStatement(SQL_INSERT);
			pstm.setString(1, bean.getAmount());
			pstm.setString(2, bean.getAsstudent_identifier());
			pstm.setString(3, bean.getDuty_identifier());
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas != 1) {
				throw new SQLException("Error, verifique sus datos e intentelo nuevamente.");
			}
			cn.commit();
		} catch (Exception e) {
			try {
				cn.rollback();
				cn.close();
			} catch (Exception e2) {
			}
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
	}

	@Override
	public void update(Asstudentpay bean) {
		Connection cn = null;
		PreparedStatement pstm = null;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			pstm = cn.prepareStatement(SQL_UPDATE);
			pstm.setString(1, bean.getAmount());
			pstm.setString(2, bean.getAsstudent_identifier());
			pstm.setString(3, bean.getDuty_identifier());
			pstm.setInt(4, bean.getIdentifier());
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas != 1) {
				throw new SQLException("Error, verifique sus datos e intentelo nuevamente.");
			}
			cn.commit();
		} catch (Exception e) {
			try {
				cn.rollback();
				cn.close();
			} catch (Exception e2) {
			}
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
	}

	@Override
	public void delete(String identifier) {
		Connection cn = null;
		PreparedStatement pstm = null;
		int filas = 0;
		try {
			// Inicio de Tx
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			pstm = cn.prepareStatement(SQL_DELETE);
			pstm.setInt(1, Integer.parseInt(identifier));
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas != 1) {
				throw new SQLException("No se pudo eliminar el usuario.");
			}
			cn.commit();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				cn.close();
			} catch (Exception e2) {
			}
		}
	}

	@Override
	public void restore(String identifier) {
		Connection cn = null;
		PreparedStatement pstm = null;
		int filas = 0;
		try {
			// Inicio de Tx
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			pstm = cn.prepareStatement(SQL_RESTORE);
			pstm.setInt(1, Integer.parseInt(identifier));
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas != 1) {
				throw new SQLException("No se pudo restaurar el usuario.");
			}
			cn.commit();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				cn.close();
			} catch (Exception e2) {
			}
		}
	}

	@Override
	public void eliminate(String identifier) {
		Connection cn = null;
		PreparedStatement pstm = null;
		int filas = 0;
		try {
			// Inicio de Tx
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			pstm = cn.prepareStatement(SQL_ELIMINATE);
			pstm.setInt(1, Integer.parseInt(identifier));
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas != 1) {
				throw new SQLException("No se pudo eliminar el usuario.");
			}
			cn.commit();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				cn.close();
			} catch (Exception e2) {
			}
		}
	}

	@Override
	public Asstudentpay mapRow(ResultSet rs) throws SQLException {
		Asstudentpay bean = new Asstudentpay();
		bean.setIdentifier(rs.getInt("identifier"));
		bean.setAmount(rs.getString("amount"));
		bean.setAsstudent_identifier(rs.getString("asstudent_identifier"));
		bean.setDuty_identifier(rs.getString("duty_identifier"));
		bean.setActive(rs.getString("active"));
		return bean;
	}

}
