package jdbc.exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

// addressbook - num, name, phone_num, email, address, birthday

public class AddressBookExam1 {
	// 주소 2개 insert, 전체 주소록내의 주소 조회해서 출력
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;

		try {
			// 1. Database와 연결 - DriverManager
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "scott", "tiger");
			// URL, username, password
			
			// 2. Statement 생성 - SQL문 전송메소드를 제공
			stmt = conn.createStatement();

			// 3. SQL문 전송
			// insert sql문 - executeUpdate() : select를 제외한 모든 SQL문 실행 , SQL문 끝에 ; 를 붙이지 않는다
			int cnt = stmt.executeUpdate(
					"insert into addressbook values(addressbook_num_seq.nextval,'김회원','010-1234-5678','aded5@a.com','경기도 성남시','2000-01-01')");
			System.out.printf("변경된(insert) row 수 : %d\n", cnt);
			cnt = stmt.executeUpdate(
					"insert into addressbook(num,name,phone_num) values(addressbook_num_seq.nextval,'최회원','02-111-2222')");
			System.out.printf("변경된(insert) row 수 : %d\n", cnt);

			// select SQl문 - executeQuery() : ResultSet , 얘만 select 나머지는 전부 executeUpdate()
			rset = stmt.executeQuery("select num,name,phone_num,email,address, birthday from addressbook");

			// select 결과를 조회(출력)
			while (rset.next()) {
				int num = rset.getInt(1);
				String name = rset.getString(2);
				String phoneNum = rset.getString(3);
				String email = rset.getString(4);
				String address = rset.getString(5);
				Date birthDay = rset.getDate(6);
				System.out.printf("%d, %s, %s, %s, %s, %s\n", num, name, phoneNum, email, address, birthDay);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 4. 연결 닫기 - ResultSet -> Statement -> Connection
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}
}
