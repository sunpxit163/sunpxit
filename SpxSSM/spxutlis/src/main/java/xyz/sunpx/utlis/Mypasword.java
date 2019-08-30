package xyz.sunpx.utlis;

import java.util.UUID;

public class Mypasword {
    /**
     * 自动生成最大36位字符串
     * @param size 字符串的大小
     * @return
     */
    public static String myUUID(int size){
        String tring = UUID.randomUUID().toString();
        String m=null;
        for (int i=0;i<size-4;i++){
            char c = tring.charAt(i);

            m+=c;
        }
        return m;


    }
}
