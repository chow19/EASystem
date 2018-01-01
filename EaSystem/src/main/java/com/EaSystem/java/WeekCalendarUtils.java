package com.EaSystem.java;
import java.lang.annotation.Documented;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;

import com.google.common.collect.Maps;

/**
 * <b>function:</b> 周历
 * 
 * @author hoojo
 * @createDate 2016-11-21 上午11:02:08
 * @file WeekCalendarUtils.java
 * @package 
 * @project 
 * @blog http://blog.csdn.net/IBM_hoojo
 * @email hoojo_@126.com
 * @version 1.0
 */
public abstract class WeekCalendarUtils {

    public final static String DATE_FORMAT = "yyyy-MM-dd";  
    
    private static String getWeekDay(Calendar cal) {
        if (cal == null) {
            return null;
        }
        
        switch (cal.get(Calendar.DAY_OF_WEEK)) {
        
            case Calendar.MONDAY:
                return "星期一";
            case Calendar.TUESDAY:
                return "星期二";
            case Calendar.WEDNESDAY:
                return "星期三";
            case Calendar.THURSDAY:
                return "星期四";
            case Calendar.FRIDAY:
                return "星期五";
            case Calendar.SATURDAY:
                return "星期六";
            default:
                return "星期日";
        }
    }
    
    private static String getSimpleWeekDay(Calendar cal) {
        if (cal == null) {
            return null;
        }
        
        switch (cal.get(Calendar.DAY_OF_WEEK)) {
        
            case Calendar.MONDAY:
                return "一";
            case Calendar.TUESDAY:
                return "二";
            case Calendar.WEDNESDAY:
                return "三";
            case Calendar.THURSDAY:
                return "四";
            case Calendar.FRIDAY:
                return "五";
            case Calendar.SATURDAY:
                return "六";
            default:
                return "日";
        }
    }
    
    public static String[] getWeekDays(boolean hasMonFirstWeekDay) {
        if (hasMonFirstWeekDay) {
            return new String[] { "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日" };
        } else {
            return new String[] { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
        }
    }

    /**
     * <b>function:</b> 获取周历
     * @author hoojo
     * @createDate 2016-11-21 下午6:00:18
     * @param begin 开始日期
     * @param end 结束日期
     * @return 周历Map
     */
    public static Map<Integer, YearModel> get(String begin, String end, boolean hasMonFirstWeekDay) {
        
        Map<Integer, YearModel> years = Maps.newLinkedHashMap();
        
        Date beginDate = null;
        Date endDate = null;
        
        try {
            beginDate = DateUtils.parseDate(begin, DATE_FORMAT);
            endDate = DateUtils.parseDate(end, DATE_FORMAT);
            
            if (beginDate.compareTo(endDate) > 0) {
                return null;
            }
            
            int weekCount = 0, monthWeekCount = 0, weekincounts=1;
            do {
                Calendar cal = DateUtils.toCalendar(beginDate);
                if (hasMonFirstWeekDay) {
                    cal.setFirstDayOfWeek(Calendar.MONDAY);
                }
                
                Map<Integer, MonthModel> months = Maps.newLinkedHashMap();
                int year = cal.get(Calendar.YEAR);
                YearModel yearModel = null;
                if (years.containsKey(year)) {
                    yearModel = years.get(year);
                    months = yearModel.getMonths();
                } else {
                    yearModel = new YearModel(year, year + "年", months);
                    years.put(year, yearModel);
                    
                    weekCount = 0;
                }
                
                Map<String, WeekModel> weeks = Maps.newLinkedHashMap();
                int month = cal.get(Calendar.MONTH) + 1;
                MonthModel monthModel = null;
                if (months.containsKey(month)) {
                     monthModel = months.get(month);
                     weeks = monthModel.getWeeks();
                } else {
                    monthModel = new MonthModel(month, year + "年" + month + "月", weeks);
                    months.put(month, monthModel);
                    
                    monthWeekCount = 0;
                }
                
                Map<String, DayModel> days = Maps.newLinkedHashMap();
                int weekInMonth = cal.get(Calendar.WEEK_OF_MONTH);
                String week = cal.getWeekYear() + "_" + month + "_" + weekInMonth;
                if (weeks.containsKey(week)) {
                    days = weeks.get(week).getDays();
                } else {
                    weeks.put(week, new WeekModel(weekInMonth, weekincounts, month + "月第" + weekInMonth + "周", days));
                    
                    monthWeekCount++;
                    weekCount++;
                    weekincounts++;
                    monthModel.setWeekCount(monthWeekCount);
                    yearModel.setWeekCount(weekCount);
                }
                
                String weekDay = getWeekDay(cal);
                days.put(week + "_" + weekDay, new DayModel(cal.get(Calendar.DAY_OF_MONTH), weekDay, getSimpleWeekDay(cal), beginDate));
                //TODO
               /* System.out.println("日期：" + DateFormatUtils.format(beginDate, DATE_FORMAT));
                System.out.println("年份：" + cal.getWeekYear());
                System.out.println("月份：" + (cal.get(Calendar.MONTH) + 1));
                System.out.println("星期：" + cal.get(Calendar.DAY_OF_WEEK));
                System.out.println("本月周次：" + cal.get(Calendar.WEEK_OF_MONTH));
                System.out.println();*/
                
                beginDate = DateUtils.addDays(beginDate, 1);
            } while (beginDate.compareTo(endDate) <= 0);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return years;
    }
    
    public static Map<Integer, YearModel> get(Date beginDate, Date endDate, boolean hasMonFirstWeekDay) {
        
        try {
            return get(DateFormatUtils.format(beginDate, DATE_FORMAT), DateFormatUtils.format(endDate, DATE_FORMAT), hasMonFirstWeekDay);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static class YearModel {
        private int yearName;
        private String displayName;
        private int weekCount;
        private Map<Integer, MonthModel> months;
        
        public YearModel(int yearName, String displayName, Map<Integer, MonthModel> months) {
            super();
            this.yearName = yearName;
            this.displayName = displayName;
            this.months = months;
        }
        
        public int getYearName() {
            return yearName;
        }
        public void setYearName(int yearName) {
            this.yearName = yearName;
        }
        public String getDisplayName() {
            return displayName;
        }
        public void setDisplayName(String displayName) {
            this.displayName = displayName;
        }
        public Map<Integer, MonthModel> getMonths() {
            return months;
        }
        public void setMonths(Map<Integer, MonthModel> months) {
            this.months = months;
        }
        
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this, ToStringStyle.SIMPLE_STYLE);
        }

        public int getWeekCount() {
            return weekCount;
        }

        public void setWeekCount(int weekCount) {
            this.weekCount = weekCount;
        }
    }
    
    public static class MonthModel {
        
        private int monthName;
        private String displayName;
        private int weekCount;
        private Map<String, WeekModel> weeks;
        
        public MonthModel(int monthName, String displayName, Map<String, WeekModel> weeks) {
            super();
            this.monthName = monthName;
            this.displayName = displayName;
            this.weeks = weeks;
        }
        
        public int getMonthName() {
            return monthName;
        }
        public void setMonthName(int monthName) {
            this.monthName = monthName;
        }
        public String getDisplayName() {
            return displayName;
        }
        public void setDisplayName(String displayName) {
            this.displayName = displayName;
        }
        public Map<String, WeekModel> getWeeks() {
            return weeks;
        }
        public void setWeeks(Map<String, WeekModel> weeks) {
            this.weeks = weeks;
        }
        public int getWeekCount() {
            return weekCount;
        }
        
        public void setWeekCount(int weekCount) {
            this.weekCount = weekCount;
        }
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this, ToStringStyle.SIMPLE_STYLE);
        }
    }
    
    public static class WeekModel {
        
        private int weekName;
        private int weekincounts;
        private String displayName;
        private Map<String, DayModel> days;
        
		public WeekModel(int weekName, int weekincounts, String displayName, Map<String, DayModel> days) {
            super();
            this.weekName = weekName;
            this.weekincounts = weekincounts;
            this.displayName = displayName;
            this.days = days;
        }
        public int getWeekName() {
            return weekName;
        }
        public void setWeekName(int weekName) {
            this.weekName = weekName;
        }
        public int getWeekincounts() {
        	return weekincounts;
        }
        public void setWeekincounts(int weekincounts) {
        	this.weekincounts = weekincounts;
        }
        public String getDisplayName() {
            return displayName;
        }
        public void setDisplayName(String displayName) {
            this.displayName = displayName;
        }
        public Map<String, DayModel> getDays() {
            return days;
        }
        public void setDays(Map<String, DayModel> days) {
            this.days = days;
        }
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this, ToStringStyle.SIMPLE_STYLE);
        }
    }
    
    public static class DayModel {
        
        private int dayName;
        private String displayName;
        private String simpleName;
        private Date date;
        
        public DayModel(int dayName, String displayName, String simpleName, Date date) {
            super();
            this.dayName = dayName;
            this.displayName = displayName;
            this.simpleName = simpleName;
            this.date = date;
        }
        public int getDayName() {
            return dayName;
        }
        public void setDayName(int dayName) {
            this.dayName = dayName;
        }
        public String getDisplayName() {
            return displayName;
        }
        public void setDisplayName(String displayName) {
            this.displayName = displayName;
        }
        public Date getDate() {
            return date;
        }
        public void setDate(Date date) {
            this.date = date;
        }
        public String getSimpleName() {
            return simpleName;
        }
        public void setSimpleName(String simpleName) {
            this.simpleName = simpleName;
        }
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this, ToStringStyle.SIMPLE_STYLE);
        }
    }
    
    public static void main(String[] args) {
        System.out.println(get("2016-06-01", "2016-06-02", false));
    }
}