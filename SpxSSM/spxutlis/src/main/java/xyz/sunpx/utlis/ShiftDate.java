package xyz.sunpx.utlis;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ShiftDate {
    /**
     * Date--->String
     * @param bydate:需要转换的时间
     * @param fm:转换成的格式
     * @return:转换后的时间
     */
    public static String dateTurnString(Date bydate,String fm){
        SimpleDateFormat sdf=new SimpleDateFormat(fm);
        String later=sdf.format(bydate);
       return later;
    }

    /**
     * String--->Date
     * @param bydate:需要转换的时间
     * @param fm:转换成的格式
     * @return转换后的时间(date)
     * @throws ParseException
     */
    public static Date StringTurnDate(String bydate,String fm) throws ParseException {
        SimpleDateFormat adf=new SimpleDateFormat(fm);
        Date parse = adf.parse(bydate);
        return parse;
    }
}
