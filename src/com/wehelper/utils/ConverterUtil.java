package com.wehelper.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;


public class ConverterUtil implements Converter<String, Date>{
	
	private String dateFormatPattern;

    public ConverterUtil(String dateFormatPattern) {
        this.dateFormatPattern = dateFormatPattern;
    }
    
	@Override
	public Date convert(String source) {
		if (source.trim().equals("")){
			return null;
		}
		DateFormat df = new SimpleDateFormat(dateFormatPattern);
		try {
			return df.parse(source);
		} catch (ParseException e) {
			throw new IllegalArgumentException(String.format(
					"转换失败，需要格式%s，但格式是[%s]", dateFormatPattern, source));
		}
		/*try{
			source = getFormattedDate(source, dateFormatPattern) + ".000000000";
			return Timestamp.valueOf(source);
		}
		catch (Exception ex){
			return null;
		}*/
	}
	

	/**
	 * 对输入的日期字符串进行格式化,如果输入的是0000/00/00 00:00:00则返回空串.
	 * 
	 * @param strDate
	 *            String 需要进行格式化的日期字符串
	 * @param strFormatTo
	 *            String 要转换的日期格式
	 * @return String 经过格式化后的字符串
	 */
	public static String getFormattedDate(String strDate, String strFormatTo) {
		if (strDate == null || strDate.trim().equals("")) {
			return "";
		}
		strDate = strDate.replace('/', '-');
		strFormatTo = strFormatTo.replace('/', '-');
		if (strDate.equals("0000-00-00 00:00:00")
				|| strDate.equals("1800-01-01 00:00:00")) {
			return "";
		}
		String formatStr = strFormatTo; // "yyyyMMdd";
		if (strDate == null || strDate.trim().equals("")) {
			return "";
		}
		switch (strDate.trim().length()) {
		case 6:
			if (strDate.substring(0, 1).equals("0")) {
				formatStr = "yyMMdd";
			} else {
				formatStr = "yyyyMM";
			}
			break;
		case 8:
			formatStr = "yyyyMMdd";
			break;
		case 10:
			if (strDate.indexOf("-") == -1) {
				formatStr = "yyyy/MM/dd";
			} else {
				formatStr = "yyyy-MM-dd";
			}
			break;
		case 11:
			if (strDate.getBytes().length == 14) {
				formatStr = "yyyy年MM月dd日";
			} else {
				return "";
			}
		case 14:
			formatStr = "yyyyMMddHHmmss";
			break;
		case 19:
			if (strDate.indexOf("-") == -1) {
				formatStr = "yyyy/MM/dd HH:mm:ss";
			} else {
				formatStr = "yyyy-MM-dd HH:mm:ss";
			}
			break;
		case 21:
			if (strDate.indexOf("-") == -1) {
				formatStr = "yyyy/MM/dd HH:mm:ss.S";
			} else {
				formatStr = "yyyy-MM-dd HH:mm:ss.S";
			}
			break;
		default:
			return strDate.trim();
		}
		try {
			SimpleDateFormat formatter = new SimpleDateFormat(formatStr);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(formatter.parse(strDate));
			formatter = new SimpleDateFormat(strFormatTo);
			return formatter.format(calendar.getTime());
		} catch (Exception e) {
			// Common.printLog("转换日期字符串格式时出错;" + e.getMessage());
			return "";
		}
	}
	
}