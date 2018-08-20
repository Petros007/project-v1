package jdbc;

public class PostgreSQLAccess extends JDBCAccess {

	public PostgreSQLAccess() throws NoConnectionException {
		super();
	}
	public void setDBParms(){
		dbDrivername = "org.postgresql.Driver";
		dbURL        = "jdbc:postgresql://143.93.200.243:5432/BWUEBDB";
		dbUser       = "user1";
		dbPassword   = "pgusers";
//		dbURL        = "jdbc:postgresql://localhost:5432/BWUEBDB";
//		dbUser       = "postgres";
//		dbPassword   = "pgadmin";
//		dbSchema     = "s654321";
		dbSchema     = "bw440_625350";
	}
	public static void main(String[] args) throws NoConnectionException { 
		new PostgreSQLAccess().getConnection();
	}
}
