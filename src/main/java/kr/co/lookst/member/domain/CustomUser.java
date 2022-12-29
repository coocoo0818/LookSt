package kr.co.lookst.member.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CustomUser extends User{

	private static final long serialVersionUID = 1L;
	
	private MemberDto memberDto;
	
	public CustomUser(String member_id, String member_pw, boolean enabled, Collection<? extends GrantedAuthority> authorities) {
		super(member_id, member_pw, authorities);
	}
	
	public CustomUser(MemberDto dto) {
		super(dto.getMember_id(), dto.getMember_pw(), dto.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getMem_auth_auth())).collect(Collectors.toList()));
		this.memberDto = dto;
	}

}
