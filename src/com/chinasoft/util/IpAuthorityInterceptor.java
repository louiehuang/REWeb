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
			context.put("AuthorityError", "���������û��޷����ʴ���Դ");
			return "noPermission";
		}

	}

	// һ��IP����һ������λ�޷��ŵĶ�������������long�ĵ�32��ʾ�޷���32λ����������
	public long getIP(InetAddress ip) {
		byte[] b = ip.getAddress();
		long l = b[0] << 24L & 0xff000000L | b[1] << 16L & 0xff0000L
				| b[2] << 8L & 0xff00 | b[3] << 0L & 0xff;
		return l;
	}

}