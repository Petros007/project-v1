package Bean;

public class CreateBean {
	int spalte;
	
	
	
	public String getCREATEHTML(int spalte){
		String html = "";
		for(int i=0;i<=spalte;i++){
			
			html+= "Spalte"+(i+1)+":<input type='text' name='"+(i+1)+"' value='' />";
		
			
		}
		return html;
	}
	
	public String getZeileHtml(){
		String html= "Spalte"+this.spalte+":<input type='text' name='"+this.spalte+"' value='' />";
	
		return html;
	}
	
}
