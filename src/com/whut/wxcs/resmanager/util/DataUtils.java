package com.whut.wxcs.resmanager.util;

import java.security.MessageDigest;

import com.whut.wxcs.resmanager.model.Catalogue;

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
	 * 判断catalogue的父目录是否为一级目录
	 */
	public static boolean isRoot(Catalogue catalogue) {
		Long parentId = catalogue.getParent().getId();
		String pStr = parentId.toString();
		if (pStr.length() == 1) {
			return true;
		}
		return false;
	}

	// 获取最大值 格式为ID_MIN_MAX 如11_2_3 要获取3
	public static Double getLastUnderLineStr(String attr) {
		return Double.valueOf(attr.substring(attr.lastIndexOf("_") + 1));
	}

	// 获取最小值 格式为ID_MIN_MAX 如11_2_3 要获取2
	public static Double getLastTwoUnderLineStr(String attr) {
		return Double.valueOf(attr.substring(
				attr.lastIndexOf("_", attr.lastIndexOf("_") - 1) + 1,
				attr.lastIndexOf("_")));
	}

	public static String formatStringByLength(String str, int length) {
		if (str.length() >= length) {
			str = str.substring(0, length - 2);
			str += "...";
		}
		return str;
	}

}
