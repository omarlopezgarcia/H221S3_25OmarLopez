package pe.edu.vallegrande.app.service.spec;

import java.util.List;

public interface CrudServiceSpec<T> {

	/**
	 * Consulta todos los registros activos de los de AS.
	 * @return Retorna una lista.
	 */
	List<T> getActiveAS();
	
	/**
	 * Consulta todos los registros inactivos de los de AS.
	 * @return Retorna una lista.
	 */
	List<T> getInactiveAS();
	
	/**
	 * Consulta todos los registros inactivos de los de PA.
	 * @return Retorna una lista.
	 */
	List<T> getActivePA();
	
	/**
	 * Consulta todos los registros inactivos de los de PA.
	 * @return Retorna una lista.
	 */
	List<T> getInactivePA();
	
	/**
	 * Consulta todos los registros inactivos de las deudas de AS.
	 * @return Retorna una lista.
	 */
	List<T> getDeudasAS();
	
	/**
	 * Consulta todos los registros inactivos de las canceladas de AS.
	 * @return Retorna una lista.
	 */
	List<T> getCanceladosAS();
	
	/**
	 * Consulta todos los registros inactivos de las deudas de PA.
	 * @return Retorna una lista.
	 */
	List<T> getDeudasPA();
	
	/**
	 * Consulta todos los registros inactivos de las canceladas de PA.
	 * @return Retorna una lista.
	 */
	List<T> getCanceladosPA();
	
	/**
	 * Retorna un registro basado en el id.
	 * @param id
	 * @return
	 */
	T getForIdAS(String identifier);

	/**
	 * Consulta datos en base a un criterio.
	 * @param bean Datos para establecer el criterio.
	 * @return Retorna una lista.
	 */
	List<T> get(T bean);
	
	/**
	 * Insertar nuevo registro.
	 * @param bean Datos del nuevo registro.
	 */
	void insert(T bean);

	/**
	 * Actualiza datos de un registro especifico.
	 * @param bean Datos del registro.
	 */
	void update(T bean);

	/**
	 * Elimina un registro de la base de datos de manera logica.
	 * @param id El id del registro a eliminar.
	 */
	void delete(String identifier);

	/**
	 * Restaura un registro eliminado de la base de datos.
	 * @param id El id del registro a eliminar.
	 */
	void restore(String identifier);

	/**
	 * Elimina un registro de la base de datos.
	 * @param id El id del registro a eliminar.
	 */
	void eliminate(String identifier);

}
