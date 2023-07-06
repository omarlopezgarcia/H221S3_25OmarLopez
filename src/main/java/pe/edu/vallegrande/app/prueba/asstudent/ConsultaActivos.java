package pe.edu.vallegrande.app.prueba.asstudent;

import java.util.List;

import pe.edu.vallegrande.app.model.Asstudent;
import pe.edu.vallegrande.app.service.CrudAsstudentService;

public class ConsultaActivos {

	public static void main(String[] args) {
		try {
			CrudAsstudentService asstudentService = new CrudAsstudentService();
			List<Asstudent> lista = asstudentService.getActive();
			for (Asstudent asstudent : lista) {
				System.out.println(asstudent);
			}
		} catch (Exception e) {
			System.err.println("Hubo un error");
		}
	}
}
