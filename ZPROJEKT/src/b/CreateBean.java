package b;

public class CreateBean {
	int spalte;
	String TName;
	String requestName;
	String requestDatenTyp;
	String radio;

	public String getP() {
		String html = "";

		for (int i = 1; i <= spalte; i++) {
			html += "Spalte" + i + ":<input type='text' name='SpalteN" + i + "' value=''>"
					+ "Datentyp:<select name='typ" + i + "'>" + "<option value='VARCHAR(100)'>String/Zeichenkette</option>"
					+ "<option value='INTEGER'>Integer/Ganzzahl</option>"
					+ "<option value='double'>Double/doppelte Genauigkeit</option>" + "</select>"
					+ "<input type='radio' name='pk' value='" + i + "' >"
					+"<input type='checkbox' name='notnull" + i + "' value='checkbox' ><br>";

		}
		return html;
	}
	
	public void createTableInDB(){
		
		String sql= "Create Table "+spalte+"."+TName;
		for (int i = 1; i <= spalte; i++) {
			
		sql+="a"+i;
		}
		System.out.println(sql);
	}

	public String getRequestDatenTyp() {
		return requestDatenTyp;
	}

	public void setRequestDatenTyp(String requestDatenTyp) {
		this.requestDatenTyp = requestDatenTyp;
	}

	public int getSpalte() {
		return spalte;
	}

	public void setSpalte(int spalte) {
		this.spalte = spalte;
	}

	public String getRequest() {
		return requestName;
	}

	public void setRequest(String request) {
		this.requestName = request;
	}
	public String getTName() {
		return TName;
	}

	public void setTName(String tName) {
		TName = tName;
	}

}
