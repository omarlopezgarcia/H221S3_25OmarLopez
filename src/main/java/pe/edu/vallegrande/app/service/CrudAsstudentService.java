package pe.edu.vallegrande.app.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.app.db.AccesoDB;
import pe.edu.vallegrande.app.model.Asstudent;
import pe.edu.vallegrande.app.service.spec.CrudServiceSpec;
import pe.edu.vallegrande.app.service.spec.RowMapper;

public class CrudAsstudentService implements CrudServiceSpec<Asstudent>, RowMapper<Asstudent> {

	private final String SQL_SELECT_ACTIVE = "SELECT * FROM asstudent_debt";
	private final String SQL_SELECT_INACTIVE = "SELECT * FROM asstudent_cancelled";
	private final String SQL_INSERT = "INSERT INTO asstudent (names, last_name, document_type, document_number, career, semester, title, amount, active) VALUES (?,?,?,?,?,?,?,?,?)";
	private final String SQL_UPDATE = "UPDATE asstudent SET names=?, last_name=?, document_type=?, document_number=?, career=?, semester=?, title=?, amount=?, active=? WHERE identifier=?";
	private final String SQL_DELETE = "UPDATE asstudent SET active='C' WHERE identifier=?";
	private final String SQL_RESTORE = "UPDATE asstudent SET active='D' WHERE identifier=?";
	private final String SQL_ELIMINATE = "DELETE FROM asstudent WHERE identifier=?";

	@Override
	public List<Asstudent> getActive() {
		List<Asstudent> lista = new ArrayList<>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs;
		try {
			cn = AccesoDB.getConnection();
			pstm = cn.prepareStatement(SQL_SELECT_ACTIVE);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Asstudent bean = mapRow(rs);
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
	public List<Asstudent> getInactive() {
		List<Asstudent> lista = new ArrayList<>();
		try (Connection cn = AccesoDB.getConnection();
				PreparedStatement pstm = cn.prepareStatement(SQL_SELECT_INACTIVE);
				ResultSet rs = pstm.executeQuery();) {
			while (rs.next()) {
				Asstudent bean = mapRow(rs);
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
	public Asstudent getForId(String identifier) {
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Asstudent bean = null;
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
	public List<Asstudent> get(Asstudent bean) {
		Connection cn = null;
		List<Asstudent> lista = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Asstudent item;
		String names, last_name, semester, title, sql;
		names = "%" + UtilService.setStringVacio(bean.getNames()) + "%";
		last_name = "%" + UtilService.setStringVacio(bean.getLast_name()) + "%";
		semester = "%" + UtilService.setStringVacio(bean.getSemester()) + "%";
		title = "%" + UtilService.setStringVacio(bean.getTitle()) + "%";
		try {
			cn = AccesoDB.getConnection();
			sql = SQL_SELECT_ACTIVE + " WHERE names LIKE ? AND last_name LIKE ? AND semester LIKE ? AND title LIKE ?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, names);
			pstm.setString(2, last_name);
			pstm.setString(3, semester);
			pstm.setString(4, title);
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
	public void insert(Asstudent bean) {
		Connection cn = null;
		PreparedStatement pstm = null;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			pstm = cn.prepareStatement(SQL_INSERT);
			pstm.setString(1, bean.getNames());
			pstm.setString(2, bean.getLast_name());
			pstm.setString(3, bean.getDocument_type());
			pstm.setString(4, bean.getDocument_number());
			pstm.setString(5, bean.getCareer());
			pstm.setString(6, bean.getSemester());
			pstm.setString(7, bean.getTitle());
			pstm.setString(8, bean.getAmount());
			pstm.setString(9, bean.getActive());
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
	public void update(Asstudent bean) {
		Connection cn = null;
		PreparedStatement pstm = null;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			pstm = cn.prepareStatement(SQL_UPDATE);
			pstm.setString(1, bean.getNames());
			pstm.setString(2, bean.getLast_name());
			pstm.setString(3, bean.getDocument_type());
			pstm.setString(4, bean.getDocument_number());
			pstm.setString(5, bean.getCareer());
			pstm.setString(6, bean.getSemester());
			pstm.setString(7, bean.getTitle());
			pstm.setString(8, bean.getAmount());
			pstm.setString(9, bean.getActive());
			pstm.setInt(10, bean.getIdentifier());
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
	public Asstudent mapRow(ResultSet rs) throws SQLException {
		Asstudent bean = new Asstudent();
		bean.setIdentifier(rs.getInt("identifier"));
		bean.setNames(rs.getString("names"));
		bean.setLast_name(rs.getString("last_name"));
		bean.setDocument_type(rs.getString("document_type"));
		bean.setDocument_number(rs.getString("document_number"));
		bean.setCareer(rs.getString("career"));
		bean.setSemester(rs.getString("semester"));
		bean.setTitle(rs.getString("title"));
		bean.setAmount(rs.getString("amount"));
		bean.setActive(rs.getString("active"));
		return bean;
	}

}
