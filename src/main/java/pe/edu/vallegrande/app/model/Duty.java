package pe.edu.vallegrande.app.model;

public class Duty {

	private Integer identifier;
	private String title, dates, active;
	
	public Duty() {
		// TODO Auto-generated constructor stub
	}

	public Duty(Integer identifier, String title, String dates, String active) {
		super();
		this.identifier = identifier;
		this.title = title;
		this.dates = dates;
		this.active = active;
	}

	public Duty(String title, String dates, String active) {
		super();
		this.title = title;
		this.dates = dates;
		this.active = active;
	}

	public Duty(Integer identifier, String title, String dates) {
		super();
		this.identifier = identifier;
		this.title = title;
		this.dates = dates;
	}

	public Duty(String title, String dates) {
		super();
		this.title = title;
		this.dates = dates;
	}

	public Integer getIdentifier() {
		return identifier;
	}

	public void setIdentifier(Integer identifier) {
		this.identifier = identifier;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
		data += ", " + this.title;
		data += ", " + this.dates;
		data += ", " + this.active + "]";
		return data;
	}
}
