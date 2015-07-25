package com.whut.wxcs.resmanager.util;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

public class MessageMail {

//	@Autowired
//	static JavaMailSender mailSender;

	public static void sendMessage(String toMail,String mailText,String mailSub) {
		// 获取JavaMailSender bean
		SimpleMailMessage mail = new SimpleMailMessage();

		try {
			ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
			JavaMailSender mailSender = (JavaMailSender) ctx.getBean("mailSender");
			
			
			mail.setTo(toMail);// 接受者
			mail.setFrom("381147882@qq.com");// 发送者,这里还可以另起Email别名，不用和xml里的username一致
			mail.setSubject(mailSub);// 主题
			mail.setText(mailText);// 邮件内容
			mailSender.send(mail);
			System.out.println("邮件发送成功");
		} catch (Exception e) {
			System.out.println("邮件发送失败");
			e.printStackTrace();
		}
	}
}
