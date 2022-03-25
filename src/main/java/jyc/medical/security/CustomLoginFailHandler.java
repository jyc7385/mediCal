package jyc.medical.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginFailHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException accessException) throws IOException, ServletException {
		
		log.error("Access Denied Handler");
		log.error("Redirect....");
		
		if (accessException instanceof AuthenticationServiceException) {
			request.setAttribute("error", "존재하지 않는 사용자입니다.");
		}
		else if(accessException instanceof BadCredentialsException) {
			request.setAttribute("error", "비밀번호가 틀립니다.");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/login");
		dispatcher.forward(request, response);
		
	}

}
