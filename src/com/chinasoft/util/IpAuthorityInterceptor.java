package com.chinasoft.util;

import java.net.InetAddress;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class IpAuthorityInterceptor extends AbstractInterceptor {
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext context = invocation.getInvocationContext();
		//Map<String, Object> session = context.getSession();

		String ip = ServletActionContext.getRequest().getRemoteAddr();  
		System.out.println(ip);
		
		if (ip.equals("127.0.0.1")) {
			return invocation.invoke();
		} else {
			context.put("AuthorityError", "你是外网用户无法访问此资源");
			return "noPermission";
		}

	}

	// 一个IP，是一个３２位无符号的二进制数。故用long的低32表示无符号32位二进制数。
	public long getIP(InetAddress ip) {
		byte[] b = ip.getAddress();
		long l = b[0] << 24L & 0xff000000L | b[1] << 16L & 0xff0000L
				| b[2] << 8L & 0xff00 | b[3] << 0L & 0xff;
		return l;
	}

}