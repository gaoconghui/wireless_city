package com.whut.wxcs.resmanager.bean.test;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.junit.Test;

public class Md5Test {

	@Test
	public void Md5() throws NoSuchAlgorithmException{
		String password = "111";
		StringBuffer buffer = new StringBuffer();
		char[] chars = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', '0', 'C', 'D', 'E', 'F' };

		byte[] bytes = password.getBytes();
		MessageDigest messageDigest = MessageDigest.getInstance("MD5");
		byte[] tags = messageDigest.digest(bytes);
		for (byte b : tags) {
			buffer.append(chars[b >> 4 & 0x0F]);
			buffer.append(chars[b & 0x0F]);
		}
		System.out.println(buffer.toString());

	}
	
}
