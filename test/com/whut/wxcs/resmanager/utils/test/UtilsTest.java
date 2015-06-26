package com.whut.wxcs.resmanager.utils.test;

import org.junit.Test;

public class UtilsTest {

	@Test
	public void phoneNumberValidate() {
		String src = "123";
		char[] srcs = src.toCharArray();
		for (char c : srcs) {
			System.out.println(c);
		}
		System.out.println(srcs.length);
	}

	@Test
	public void emailValid() {
		String email = "313011249@qq.com";
		int pos = email.indexOf("@");
		if (pos == -1 || pos == 0 || pos == email.length() - 1) {
			System.out.println("1false");
		}
		String[] strings = email.split("@");
		if (strings.length != 2) {
			System.out.println("2false");
		}
		pos = strings[1].indexOf(".");
		if (pos == -1 || pos == 0 || pos == email.length() - 1) {
			System.out.println("3false");
		}
		System.out.println(strings[1]);
		strings = strings[1].split("\\u002E");
		System.out.println(strings.length);
		if (strings.length != 2) {
			System.out.println("4false");
		}
		System.out.println("true");
	}
}
