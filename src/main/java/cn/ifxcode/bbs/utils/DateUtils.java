package cn.ifxcode.bbs.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {
	
	private static final SimpleDateFormat dt14 = new SimpleDateFormat("yyyyMMddHHmmss");
	private static final SimpleDateFormat dt12 = new SimpleDateFormat("yyyyMMddHHmm");
	private static final SimpleDateFormat dtlong14 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static final SimpleDateFormat dt8 = new SimpleDateFormat("yyyyMMdd");
	private static final SimpleDateFormat dt10 = new SimpleDateFormat("yyyy-MM-dd");
	private static final SimpleDateFormat dtfen14 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	private static final SimpleDateFormat dt10Ch = new SimpleDateFormat("yyyy年MM月dd日");

	public static String dt10FromDate(Date date) {
		try {
			return dt10.format(date);
		} catch (Exception e) {
		}
		return null;
	}

	public static String dt14LongFormat(Date date) {
		return dtlong14.format(date);
	}

	public static Date dt10FromStr(String date) throws ParseException {
		return dt10.parse(date);
	}

	public static String dt14FromDate(Date date) {
		return dt14.format(date);
	}

	public static Date getOneHourLater(Date date) {
		if (date == null) {
			date = new Date();
		}
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.HOUR_OF_DAY, 1);
		return c.getTime();
	}

	public static String dtfen14FromDate(Date date) {
		return dtfen14.format(date);
	}

	public static Date dtfen14FromStr(String date) {
		try {
			return dtfen14.parse(date);
		} catch (Exception e) {
			return null;
		}
	}

	public static String dt12FromDate(Date date) {
		return dt12.format(date);
	}

	public static String dtlong14FromDate(Date date) {
		if (date == null) {
			return "";
		}
		return dtlong14.format(date);
	}

	public static Date dt14FromStr(String time) {
		try {
			return dtlong14.parse(time);
		} catch (ParseException e) {
		}
		return null;
	}

	public static String dt8FormDate(Date date) {
		return dt8.format(date);
	}

	public static String dt10ChFromDate(Date date) {
		return dt10Ch.format(date);
	}

	public static Date getBeginDateTime(Date date) {
		if (date == null) {
			date = new Date();
		}
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		return c.getTime();
	}

	public static Date getEndDateTime(Date date) {
		if (date == null) {
			date = new Date();
		}
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		return c.getTime();
	}

	public static int[] getDateLength(String fromDate, String toDate) {
		Calendar c1 = getCal(fromDate);
		Calendar c2 = getCal(toDate);
		int[] p1 = { c1.get(Calendar.YEAR), c1.get(Calendar.MONTH),
				c1.get(Calendar.DAY_OF_MONTH) };
		int[] p2 = { c2.get(Calendar.YEAR), c2.get(Calendar.MONTH),
				c2.get(Calendar.DAY_OF_MONTH) };
		return new int[] {
				p2[0] - p1[0],
				p2[0] * 12 + p2[1] - p1[0] * 12 - p1[1],
				(int) ((c2.getTimeInMillis() - c1.getTimeInMillis()) / (24 * 3600 * 1000)) };
	}

	static Calendar getCal(String date) {
		Calendar cal = Calendar.getInstance();
		cal.clear();
		cal.set(Integer.parseInt(date.substring(0, 4)),
				Integer.parseInt(date.substring(5, 7)) - 1,
				Integer.parseInt(date.substring(8, 10)));
		return cal;
	}

	public static Date getThisMonthFirstDay(Date date) throws ParseException {
		try {
			if (date == null) {
				date = new Date();
			}
			Calendar c = Calendar.getInstance();
			c.setTime(date);
			c.set(Calendar.DAY_OF_MONTH, 1);
			c.set(Calendar.HOUR_OF_DAY, 0);
			c.set(Calendar.MINUTE, 0);
			c.set(Calendar.SECOND, 0);
			return c.getTime();
		} catch (Exception e) {
			return null;
		}

	}

	public static boolean isfastpass(Date createtime) {
		boolean isfast = true;
		String create_time = DateUtils.dtfen14FromDate(createtime);
		String hourminute = create_time.substring(create_time.length() - 5);
		Calendar c = Calendar.getInstance();
		c.setTime(createtime);
		int month = c.get(Calendar.MONTH) + 1;
		if (month >= 4 && month <= 9) {
			if (hourminute.compareTo("17:30") <= 0
					&& hourminute.compareTo("08:30") >= 0) {
				isfast = true;
			} else {
				isfast = false;
			}
		} else if (month >= 10 || month <= 3) {
			if (hourminute.compareTo("16:30") <= 0
					&& hourminute.compareTo("08:30") >= 0) {
				isfast = true;
			} else {
				isfast = false;
			}
		} else {
			isfast = false;
		}
		return isfast;
	}

	public static Date getSevenDaysAgoDate(Date date) {
		if (date == null) {
			date = new Date();
		}
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DAY_OF_MONTH, -7);
		return c.getTime();
	}

}