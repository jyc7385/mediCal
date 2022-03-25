package jyc.medical.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jyc.medical.domain.AuthVO;
import jyc.medical.domain.MemberVO;
import jyc.medical.service.MemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberTests {

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	  
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	@Setter(onMethod_ = { @Autowired })
	private MemberService service;
	
	/*
	@Test
	public void testInsertMember() {

		String sql = "insert into user_info_tbl(id, pw, name, birthdate, gender) values (?,?,?,?,?)";
	    
		Connection con = null;
		PreparedStatement pstmt = null;
	     
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);     
			
			pstmt.setString(1, "jyc0511");
			pstmt.setString(2, pwencoder.encode("rrrr9595"));
			pstmt.setString(3, "정영철");
			pstmt.setObject(4, LocalDate.of(1995, 5, 11));
			pstmt.setString(5, String.valueOf('m'));
			
			pstmt.executeUpdate();
			
			if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
			if(con != null) { try { con.close();  } catch(Exception e) {} }   
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql); 
			
			pstmt.setString(1, "jhc0730");
			pstmt.setString(2, pwencoder.encode("rrrr9797"));
			pstmt.setString(3, "정한철");
			pstmt.setObject(4, LocalDate.of(1997, 7, 30));
			pstmt.setString(5, String.valueOf('m'));
			
			pstmt.executeUpdate();
			
			if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
			if(con != null) { try { con.close();  } catch(Exception e) {} }   
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
						
	}
	*/
	
	/*
	@Test
	public void testInsertAuth() {
	    
		String sql = "insert into user_auth_tbl (id, auth) values (?,?)";
	    
		Connection con = null;
		PreparedStatement pstmt = null;
      
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			          
	        pstmt.setString(1, "jyc0511");
	        pstmt.setString(2, "ROLE_USER");	 
	        
	        pstmt.executeUpdate();
	        
			if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
			if(con != null) { try { con.close();  } catch(Exception e) {} }
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			          
	        pstmt.setString(1, "jhc0730");
	        pstmt.setString(2, "ROLE_USER");	 
	        
	        pstmt.executeUpdate();
	        
			if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
			if(con != null) { try { con.close();  } catch(Exception e) {} }
   	        
        }
		
		catch(Exception e) {				
			e.printStackTrace();			
		}
						
	}
	*/
	
	/*
	@Test
	public void testJoin() {
		
		MemberVO member = new MemberVO();
		
		member.setId("test2");
		member.setPw(pwencoder.encode("test2"));
		member.setName("test2");
		LocalDate td = LocalDate.of(1995, 5, 11);
		member.setBirthDate(td);
		member.setGender('m');
		
		service.joinMember(member);
		
		log.info("join........" + member);
		
		AuthVO auth = new AuthVO();
		
		auth.setId("test2");
		auth.setAuth("ROLE_USER");
		
		service.joinAuth(auth);
		
		log.info("join........" + auth);
		
	}
	*/
	
	@Test
	public void testJoin() {
		
		MemberVO member = new MemberVO();
		
		member.setId("test3");
		member.setPw("test3");
		member.setName("test3");
		LocalDate td = LocalDate.of(1995, 5, 11);
		member.setBirthDate(td);
		member.setGender('f');
		
		AuthVO auth = new AuthVO();
		
		// auth.setId("test3");
		// auth.setAuth("ROLE_USER");
		
		service.join(member, auth);
		
		log.info("join........" + member);
		log.info("join........" + auth);
		
	}
  
}