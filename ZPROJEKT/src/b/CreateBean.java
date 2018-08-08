package b;

public class CreateBean {
	int spalte;
	String request;

	public String getP() {
		String html = "";

		for (int i = 1; i <= spalte; i++) {
			html += "Spalte" + i + ":<input type='text' name='SpalteN" + i + "' value=''>";
			html += "Datentyp:<select name='typ'>" + "<option value='String'>String/Zeichenkette</option>"
					+ "<option value='int'>Integer/Ganzzahl</option>"
					+ "<option value='double'>Double/doppelte Genauigkeit</option>" + "</select>";
			html += "<input type='radio' name='pk' value='" + i + "' /><br>";

		}
		return html;
	}

	public void getArray() {
		String[] pA = new String[spalte];
		for (int i = 1; i <= spalte; i++) {
			pA[i - 1] = request;
			System.out.println(pA[i - 1]);
		}
	}
	
	

	public int getSpalte() {
		return spalte;
	}

	public void setSpalte(int spalte) {
		this.spalte = spalte;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

}
