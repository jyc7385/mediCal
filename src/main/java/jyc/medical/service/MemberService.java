package jyc.medical.service;

import jyc.medical.domain.AuthVO;
import jyc.medical.domain.MemberVO;

public interface MemberService {

	public void join(MemberVO member, AuthVO auth);
		
	public int idCheck(String memberId) throws Exception;
	
	public MemberVO getUserInfo(String id);
	
	public boolean updatePW(MemberVO member);
	
	public boolean deleteUser(String id);
	
}
