package b;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.NoConnectionException;
import jdbc.PostgreSQLAccess;

public class RegistrierungBean {

	String email;
	String passwort;
	
	public boolean registrierungcheck() throws NoConnectionException, SQLException{
		// true - insert hat geklappt
		// false - diesen User gibt's schon in der DB
		//wennWerteZuLangDannAbschneiden
		if (this.checkUserExists()){
			System.out.println("User " + this.email + " existiert bereits");
			return false;
		}else{
			this.registrierung();
			return true;
		}
	}
	
	
	public void registrierung() throws NoConnectionException, SQLException {
		Connection dbConn = new PostgreSQLAccess().getConnection();
		String sql = "INSERT INTO ACCOUNT " + "(email, passwort ) "
				+ "values (?,?)";
		System.out.println(sql);
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, this.email);
		prep.setString(2, this.passwort);

		prep.executeUpdate();
		System.out.println("User " + this.email + " erfolgreich angelegt");
	}
	
	public boolean checkUserExists() throws SQLException {
		// gibt es diesen User schon in der DB?
		// true - gibt schon
		// false - gibt's noch nicht
		Connection dbConn = new PostgreSQLAccess().getConnection();
//		String sql = "SELECT userid FROM ACCOUNT where userid = '" + this.getUserid() + "'";
//		System.out.println(sql);
//		Statement simplestatement = dbConn.createStatement();
//		ResultSet dbRes = simplestatement.executeQuery(sql);
		String sql = "SELECT email FROM ACCOUNT where email = ?";
		System.out.println(sql);
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, email);
		ResultSet dbRes = prep.executeQuery();
		//boolean gefunden = dbRes.next();
		if (dbRes.next() == true) {
			return true;	// Das ResultSet findet den User ( Eine Zeile weiter nach unten war möglich)
		} else {
			return false;	// User existiert nicht, da das ResultSet nicht weiter gehen konnte.
		}
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPasswort() {
		return passwort;
	}


	public void setPasswort(String passwort) {
		this.passwort = passwort;
	}
	
	
	
}
