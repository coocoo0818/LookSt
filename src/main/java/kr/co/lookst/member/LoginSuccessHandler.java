package kr.co.lookst.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;

public class LoginSuccessHandler implements org.springframework.security.web.authentication.AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		System.out.println("Login Success");
		
		List<String> roleNames = new ArrayList<>();
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		System.out.println("ROLE NAMES: " + roleNames);
		
		if(roleNames.contains("admin")) {
			response.sendRedirect("/lookst/admin/member_management");
			return;
		}
		
		if(roleNames.contains("member")) {
			response.sendRedirect("/lookst");
			return;
		}
		
		response.sendRedirect("/lookst");
	}

}
