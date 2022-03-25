package jyc.medical.mapper;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jyc.medical.domain.AuthVO;
import jyc.medical.domain.MemberVO;
import jyc.medical.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
//if use xml setting
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
}) // when use PasswordEncoder, use security-context.xml
// else if use java setting
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	// Insert test
	/*
	@Test
	public void testInsert() {
		
		MemberVO member = new MemberVO();
		
		member.setId("test2");
		member.setPw(pwencoder.encode("test2"));
		member.setName("test2");
		LocalDate td = LocalDate.of(1995, 5, 11);
		member.setBirthDate(td);
		member.setGender('m');
		
		mapper.joinMember(member);
		
		log.info(member);
		
		AuthVO auth = new AuthVO();
		
		auth.setId("test2");
		auth.setAuth("ROLE_USER");
		
		mapper.joinAuth(auth);
		
		log.info(auth);
		
	}
	*/
	
	/*
	@Test
	public void memberIdChk() throws Exception {
		String id = "test4";
		String id2 = "test444";
		
		mapper.idCheck(id);
		mapper.idCheck(id2);
	}
	*/
	
}
