package pe.edu.vallegrande.app.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.app.db.AccesoDB;
import pe.edu.vallegrande.app.model.Student2;
import pe.edu.vallegrande.app.service.spec.CrudServiceSpec;
import pe.edu.vallegrande.app.service.spec.RowMapper;

public class CrudStudentService2 implements CrudServiceSpec<Student2>, RowMapper<Student2> {

	private final String SQL_SELECT_ASACTIVE = "SELECT * FROM studentAS_active";
	private final String SQL_SELECT_ASINACTIVE = "SELECT * FROM studentAS_inactive";
	private final String SQL_SELECT_ASDEUDAS = "SELECT * FROM studentAS_deudas";
	private final String SQL_SELECT_ASCANCELADOS = "SELECT * FROM studentAS_cancelados";
	private final String SQL_SELECT_PAACTIVE = "SELECT * FROM studentPA_active";
	private final String SQL_SELECT_PAINACTIVE = "SELECT * FROM studentPA_inactive";
	private final String SQL_SELECT_PADEUDAS = "SELECT * FROM studentPA_deudas";
	private final String SQL_SELECT_PACANCELADOS = "SELECT * FROM studentPA_cancelados";
	private final String SQL_INSERT = "INSERT INTO student (names, last_name, document_type, document_number, career, semester, duty, dates) VALUES (?,?,?,?,?,?,?,?,)";
	private final String SQL_UPDATE = "UPDATE student SET names=?, last_name=?, document_type=?, document_number=?, career=?, semester=?, duty=?, dates=? WHERE identifier=?";
	private final String SQL_DELETE = "UPDATE student SET active='I' WHERE identifier=?";
	private final String SQL_RESTORE = "UPDATE student SET active='A' WHERE identifier=?";
	private final String SQL_ELIMINATE = "DELETE FROM student WHERE identifier=?";

	@Override
	public List<Student2> getActiveAS() {
		List<Student2> lista = new ArrayList<>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs;
		try {
			cn = AccesoDB.getConnection();
			pstm = cn.prepareStatement(SQL_SELECT_ASACTIVE);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Student2 bean = mapRow(rs);
				lista.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}
	
	public List<Student2> getActivePA() {
		List<Student2> lista = new ArrayList<>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs;
		try {
			cn = AccesoDB.getConnection();
			pstm = cn.prepareStatement(SQL_SELECT_PAACTIVE);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Student2 bean = mapRow(rs);
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
	public List<Student2> getInactiveAS() {
		List<Student2> lista = new ArrayList<>();
		try (Connection cn = AccesoDB.getConnection();
				PreparedStatement pstm = cn.prepareStatement(SQL_SELECT_ASINACTIVE);
				ResultSet rs = pstm.executeQuery();) {
			while (rs.next()) {
				Student2 bean = mapRow(rs);
				lista.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}
	
	public List<Student2> getInactivePA() {
		List<Student2> lista = new ArrayList<>();
		try (Connection cn = AccesoDB.getConnection();
				PreparedStatement pstm = cn.prepareStatement(SQL_SELECT_PAINACTIVE);
				ResultSet rs = pstm.executeQuery();) {
			while (rs.next()) {
				Student2 bean = mapRow(rs);
				lista.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}

	public List<Student2> getDeudasAS() {
		List<Student2> lista = new ArrayList<>();
		try (Connection cn = AccesoDB.getConnection();
				PreparedStatement pstm = cn.prepareStatement(SQL_SELECT_ASDEUDAS);
				ResultSet rs = pstm.executeQuery();) {
			while (rs.next()) {
				Student2 bean = mapRow(rs);
				lista.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}
	
	public List<Student2> getDeudasPA() {
		List<Student2> lista = new ArrayList<>();
		try (Connection cn = AccesoDB.getConnection();
				PreparedStatement pstm = cn.prepareStatement(SQL_SELECT_PADEUDAS);
				ResultSet rs = pstm.executeQuery();) {
			while (rs.next()) {
				Student2 bean = mapRow(rs);
				lista.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}
	
	public List<Student2> getCanceladosAS() {
		List<Student2> lista = new ArrayList<>();
		try (Connection cn = AccesoDB.getConnection();
				PreparedStatement pstm = cn.prepareStatement(SQL_SELECT_ASCANCELADOS);
				ResultSet rs = pstm.executeQuery();) {
			while (rs.next()) {
				Student2 bean = mapRow(rs);
				lista.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}
	
	public List<Student2> getCanceladosPA() {
		List<Student2> lista = new ArrayList<>();
		try (Connection cn = AccesoDB.getConnection();
				PreparedStatement pstm = cn.prepareStatement(SQL_SELECT_PACANCELADOS);
				ResultSet rs = pstm.executeQuery();) {
			while (rs.next()) {
				Student2 bean = mapRow(rs);
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
	public Student2 getForIdAS(String identifier) {
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Student2 bean = null;
		String sql;
		try {
			cn = AccesoDB.getConnection();
			sql = SQL_SELECT_ASACTIVE + " WHERE identifier=?";
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
	
	public Student2 getForIdPA(String identifier) {
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Student2 bean = null;
		String sql;
		try {
			cn = AccesoDB.getConnection();
			sql = SQL_SELECT_PAACTIVE + " WHERE identifier=?";
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
	public List<Student2> get(Student2 bean) {
		Connection cn = null;
		List<Student2> lista = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Student2 item;
		String names, last_name, sql;
		names = "%" + UtilService.setStringVacio(bean.getNames()) + "%";
		last_name = "%" + UtilService.setStringVacio(bean.getLast_name()) + "%";
		try {
			cn = AccesoDB.getConnection();
			sql = SQL_SELECT_ASACTIVE + " WHERE names LIKE ? AND last_name LIKE ?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, names);
			pstm.setString(2, last_name);
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
	
	public List<Student2> get1(Student2 bean) {
		Connection cn = null;
		List<Student2> lista = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Student2 item;
		String names, last_name, sql;
		names = "%" + UtilService.setStringVacio(bean.getNames()) + "%";
		last_name = "%" + UtilService.setStringVacio(bean.getLast_name()) + "%";
		try {
			cn = AccesoDB.getConnection();
			sql = SQL_SELECT_PAACTIVE + " WHERE names LIKE ? AND last_name LIKE ?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, names);
			pstm.setString(2, last_name);
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
	public void insert(Student2 bean) {
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
			pstm.setString(7, bean.getDuty());
			pstm.setString(9, bean.getDates());
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
	public void update(Student2 bean) {
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
			pstm.setString(7, bean.getDuty());
			pstm.setString(9, bean.getDates());
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
	public Student2 mapRow(ResultSet rs) throws SQLException {
		Student2 bean = new Student2();
		bean.setIdentifier(rs.getInt("identifier"));
		bean.setNames(rs.getString("names"));
		bean.setLast_name(rs.getString("last_name"));
		bean.setDocument_type(rs.getString("document_type"));
		bean.setCareer(rs.getString("career"));
		bean.setSemester(rs.getString("semester"));
		bean.setDuty(rs.getString("duty"));
		bean.setDates(rs.getString("dates"));
		bean.setPayments(rs.getString("payments"));
		bean.setActive(rs.getString("active"));
		return bean;
	}

}
