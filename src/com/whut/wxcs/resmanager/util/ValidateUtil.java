package com.whut.wxcs.resmanager.util;

import java.util.Collection;

/**
 * 校验工具类
 * 
 * @author apple
 *
 */
public class ValidateUtil {

	/**
	 * 检验是否有效
	 * 
	 * @param src
	 */
	public static boolean isVaild(String src) {
		if (src == null || src.trim().equals("")) {
			return false;
		}
		return true;
	}

	public static boolean isVaild(Collection collection) {
		return !(collection == null || collection.isEmpty());
	}

	/**
	 * 验证手机号码的合法性 
	 */
	public static boolean phoneNumberValid(String src) {
		char[] srcs = src.toCharArray();
		if (srcs.length != 11) {
			return false;
		}
		return true;
	}

}
