package com.whut.wxcs.resmanager.mail;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

public class SendMail {
	public ApplicationContext ctx = null;

	public SendMail() {
		// 获取上下文
		ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	}

	public void send() {
		// 获取JavaMailSender bean
		JavaMailSender sender = (JavaMailSender) ctx.getBean("mailSender");
		System.out.println(sender);
		SimpleMailMessage mail = new SimpleMailMessage(); 

		try {
			mail.setTo("381147882@qq.com");// 接受者
			mail.setFrom("381147882@qq.com");// 发送者,这里还可以另起Email别名，不用和xml里的username一致
			mail.setSubject("spring mail test!");// 主题
			mail.setText("springMail的简单发送测试");// 邮件内容
			sender.send(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		SendMail sendMail = new SendMail();
		sendMail.send();
	}
}