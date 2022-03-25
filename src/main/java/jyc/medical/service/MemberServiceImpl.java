package jyc.medical.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.stereotype.Service;

import jyc.medical.domain.AuthVO;
import jyc.medical.domain.MemberVO;
import jyc.medical.mapper.MemberMapper;
import jyc.medical.service.MemberService;
import lombok.AllArgsConstructor;
// import lombok.extern.log4j.Log4j;

// @Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Override
	public void join(MemberVO member, AuthVO auth) {
		
		member.setPw(pwencoder.encode(member.getPw()));
		
		auth.setId(member.getId());
		auth.setAuth("ROLE_USER");
				
		mapper.joinMember(member);
		mapper.joinAuth(auth);
		
	}
	
	@Override
	public int idCheck(String memberId) throws Exception { 	
		
		return mapper.idCheck(memberId);	
		
	}
	
	@Override
	public MemberVO getUserInfo(String id) {
		
		return mapper.getUserInfo(id);
		
	}
	
	@Override
	public boolean updatePW(MemberVO member) {
		
		member.setPw(pwencoder.encode(member.getPw()));
		
		return mapper.updatePW(member) == 1;
		
	}
	
	@Override
	public boolean deleteUser(String id) {

		return mapper.deleteUser(id) == 1;
		
	}
	
}
