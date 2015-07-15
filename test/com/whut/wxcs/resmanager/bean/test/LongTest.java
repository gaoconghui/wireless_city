package com.whut.wxcs.resmanager.bean.test;

import org.junit.Test;

public class LongTest {
	@Test
	public void longTest() {
		Long l = 123l;
		String str = l.toString();
		System.out.println(str.length());
	}
}
