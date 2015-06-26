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
	
    /**
     * 判断集合是否为空 
     * 集合为空返回false 否则返回true
     */
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

	/**
	 * 验证邮箱的合法性
	 */
	public static boolean emailValid(String email) {
		int pos = email.indexOf("@");
		if (pos == -1 || pos == 0 || pos == email.length() - 1) {
			return false;
		}
		String[] strings = email.split("@");
		if (strings.length != 2) {
			return false;
		}
		pos = strings[1].indexOf("\\u002E");
		if (pos == -1 || pos == 0 || pos == email.length() - 1) {
			return false;
		}
		strings = strings[1].split("\\u002E");
		if (strings.length != 2) {
			return false;
		}
		return true;
	}
}
