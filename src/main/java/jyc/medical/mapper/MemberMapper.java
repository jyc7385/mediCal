package jyc.medical.mapper;

import org.apache.ibatis.annotations.Param;

import jyc.medical.domain.AuthVO;
import jyc.medical.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String userid);
	
	public void joinMember(MemberVO member);
	
	public void joinAuth(AuthVO auth);
	
	public int idCheck(String memberId);
	
	public MemberVO getUserInfo(@Param("id") String id);
	
	public int updatePW(MemberVO member);
	
	public int deleteUser(@Param("id") String id);
	
}
