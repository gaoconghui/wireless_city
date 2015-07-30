package com.whut.wxcs.resmanager.filter;

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

import com.whut.wxcs.resmanager.model.Provider;

public class ProviderPageFilter implements Filter {

	private String providerCheckUrl;

	public void init(FilterConfig fConfig) throws ServletException {
		providerCheckUrl = fConfig.getServletContext().getInitParameter(
				"providerJSP");
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		String url = httpServletRequest.getServletPath();
		if (url.equals(providerCheckUrl)) {
			HttpSession session = httpServletRequest.getSession();
			Provider provider = (Provider) session.getAttribute("provider");
			if (provider != null) {
				chain.doFilter(httpServletRequest, httpServletResponse);
				return;
			} else {
				httpServletResponse.sendRedirect(httpServletRequest
						.getContextPath() + "/front/login.jsp");
				return;
			}
		} else {
			chain.doFilter(request, response);
		}
	}

}
