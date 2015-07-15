package com.whut.wxcs.resmanager.util;

import java.security.MessageDigest;

public class DataUtils {
	/**
	 * MD5加密算法
	 */
	public static String MD5(String src) {
		try {
			StringBuffer buffer = new StringBuffer();
			char[] chars = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'A', 'B', '0', 'C', 'D', 'E', 'F' };

			byte[] bytes = src.getBytes();
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			byte[] tags = messageDigest.digest(bytes);
			for (byte b : tags) {
				buffer.append(chars[b >> 4 & 0x0F]);
				buffer.append(chars[b & 0x0F]);
			}
			return buffer.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 将字符串转换为数组，分隔
	 */
	public static String[] toArray(String src) {
		if (ValidateUtil.isVaild(src)) {
			return src.split(",");
		}
		return null;
	}

	/**
	 * 判断catalogue_id的位数是否为3
	 */
	public static boolean isTrible(Long l) {
		String lStr = l.toString();
		if (lStr.length() == 3) {
			return true;
		}
		return false;
	}

}
