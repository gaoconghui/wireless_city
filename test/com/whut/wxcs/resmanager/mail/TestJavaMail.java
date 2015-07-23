package com.whut.wxcs.resmanager.mail;

import java.util.Properties;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class TestJavaMail {

	// private JavaMailSenderImpl sender = new JavaMailSenderImpl();
	//
	// sender.setUsername("381147882@qq.com");
	// sender.setPassword("ezuoju_1314");
	// sender.setHost("smtp.qq.com");
	// }
	//
	// public void simpleSend() {
	// SimpleMailMessage smm = new SimpleMailMessage();
	// smm.setFrom(sender.getUsername());
	// smm.setTo("381147882@qq.com");
	// smm.setSubject("hello world");
	// smm.setText("hello");
	//
	// Properties prop = new Properties();
	// prop.put(" mail.smtp.auth ", " true "); //
	// 将这个参数设为true，让服务器进行认证,认证用户名和密码是否正确
	// prop.put(" mail.smtp.timeout ", " 25000 ");
	// sender.setJavaMailProperties(prop);
	//
	// sender.send(smm);
	// }
	//
	// public static void main(String[] args) {
	// TestJavaMail javaMail = new TestJavaMail();
	// javaMail.simpleSend();
	// System.out.println("hello");
	// }

	public static void main(String[] args) {
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
		System.out.println(" 邮件.. ");
		// 设定mail server
		senderImpl.setHost("smpt.qq.com");

		// 建立邮件消息
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setTo("381147882@qq.com");
		mailMessage.setSubject(" 测试简单文本邮件发送！ ");
		mailMessage.setText(" 测试我的简单邮件发送机制！！ ");
		mailMessage.setFrom("381147882@qq.com");

		senderImpl.setUsername("381147882@qq.com"); // 根据自己的情况,设置username
		senderImpl.setPassword("ezuoju_1314"); // 根据自己的情况, 设置password

		Properties prop = new Properties();
		prop.put(" mail.smtp.auth ", " true "); // 将这个参数设为true，让服务器进行认证,认证用户名和密码是否正确
		prop.put(" mail.smtp.timeout ", " 2500 ");
		senderImpl.setJavaMailProperties(prop);
		// 发送邮件
		senderImpl.send(mailMessage);

		System.out.println(" 邮件发送成功.. ");
	}

}
