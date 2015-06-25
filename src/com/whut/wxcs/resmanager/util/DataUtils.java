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
}
