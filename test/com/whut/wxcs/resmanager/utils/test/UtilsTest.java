package com.whut.wxcs.resmanager.utils.test;


import org.junit.Test;

public class UtilsTest {

	@Test
	public void phoneNumberValidate() {
		String src = "123";
		char[] srcs= src.toCharArray();
		for(char c:srcs){
			System.out.println(c);
		}
		System.out.println(srcs.length);
	}

}
