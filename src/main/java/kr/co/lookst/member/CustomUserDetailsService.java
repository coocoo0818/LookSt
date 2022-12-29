package kr.co.lookst.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.co.lookst.member.domain.CustomUser;
import kr.co.lookst.member.domain.MemberDto;
import kr.co.lookst.member.service.MemberService;
import lombok.Setter;

public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = {@Autowired })
	private MemberService service;
	
	@Override
	public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {
		System.out.println("load user by member_id : " + member_id);
		
		MemberDto dto = service.read(member_id);
		
		System.out.println("querued by member mapper : " + dto);
		
		return dto == null ? null : new CustomUser(dto);
	}

}
