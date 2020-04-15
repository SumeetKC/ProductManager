package com.product.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionCheckFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		boolean loginrequest = req.getRequestURI().endsWith("indexLogin.html")
				|| req.getRequestURI().endsWith("doLogin.html") || req.getRequestURI().endsWith("registerform.html")
				|| req.getRequestURI().endsWith("signupprocess.html")
				|| req.getRequestURI().endsWith("forgotPassView.html") 
				|| req.getRequestURI().endsWith("savepass.html")
				|| req.getRequestURI().endsWith("saveforgotpass.html")
				|| req.getRequestURI().endsWith("sendToken.html") 
				|| req.getRequestURI().endsWith("generatePass.html");

		if ((loginrequest)) {
			chain.doFilter(request, response);
		} else {
			if (isSessionExpired((HttpServletRequest) request)) {
				((HttpServletResponse) response)
						.sendRedirect(((HttpServletRequest) request).getContextPath() + "/expired.jsp");
				// System.out.println(((HttpServletRequest)
				// request).getContextPath() + "/expiredsession.html");
				response.flushBuffer();
			} else {
				// ..its not yet expired, continue
				chain.doFilter(request, response);
			}
		}
	}

	public boolean isSessionExpired(ServletRequest request) {
		HttpSession session = ((HttpServletRequest) request).getSession();
		if (session == null || session.getAttribute("userValid") == null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
