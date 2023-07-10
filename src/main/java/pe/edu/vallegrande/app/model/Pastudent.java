package pe.edu.vallegrande.app.model;

public class Pastudent {

	private Integer identifier;
	private String names, last_name, document_type, document_number, career, semester, title, amount, dates, active;
	
	public Pastudent() {
		// TODO Auto-generated constructor stub
	}

	public Pastudent(Integer identifier, String names, String last_name, String document_type, String document_number,
			String career, String semester, String title, String amount, String dates, String active) {
		super();
		this.identifier = identifier;
		this.names = names;
		this.last_name = last_name;
		this.document_type = document_type;
		this.document_number = document_number;
		this.career = career;
		this.semester = semester;
		this.title = title;
		this.amount = amount;
		this.dates = dates;
		this.active = active;
	}

	public Pastudent(String names, String last_name, String document_type, String document_number, String career,
			String semester, String title, String amount,String dates, String active) {
		super();
		this.names = names;
		this.last_name = last_name;
		this.document_type = document_type;
		this.document_number = document_number;
		this.career = career;
		this.semester = semester;
		this.title = title;
		this.amount = amount;
		this.dates= dates;
		this.active = active;
	}

	public Pastudent(Integer identifier, String names, String last_name, String document_type, String document_number,
			String career, String semester, String title, String amount,String dates) {
		super();
		this.identifier = identifier;
		this.names = names;
		this.last_name = last_name;
		this.document_type = document_type;
		this.document_number = document_number;
		this.career = career;
		this.semester = semester;
		this.title = title;
		this.amount = amount;
		this.dates = dates;
	}

	public Pastudent(String names, String last_name, String document_type, String document_number, String career,
			String semester, String title, String amount, String dates) {
		super();
		this.names = names;
		this.last_name = last_name;
		this.document_type = document_type;
		this.document_number = document_number;
		this.career = career;
		this.semester = semester;
		this.title = title;
		this.amount = amount;
		this.dates = dates;
	}

	public Integer getIdentifier() {
		return identifier;
	}

	public void setIdentifier(Integer identifier) {
		this.identifier = identifier;
	}

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getDocument_type() {
		return document_type;
	}

	public void setDocument_type(String document_type) {
		this.document_type = document_type;
	}

	public String getDocument_number() {
		return document_number;
	}

	public void setDocument_number(String document_number) {
		this.document_number = document_number;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	public String getDates() {
		return dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}
	
	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}
	
	@Override
	public String toString() {
		String data = "[" + this.identifier;
		data += ", " + this.names;
		data += ", " + this.last_name;
		data += ", " + this.document_type;
		data += ", " + this.document_number;
		data += ", " + this.career;
		data += ", " + this.semester;
		data += ", " + this.title;
		data += ", " + this.amount;
		data += ", " + this.dates;
		data += ", " + this.active + "]";
		return data;
	}
}
