package com.yinjie.bbs_java.util;

import com.yinjie.bbs_java.util.filter.WordFilter;

import java.util.List;

public class test {
    public static void main(String[] args) {
        String context = "被驴踢了";
        String sensitiveWord = WordFilter.replaceWords(context);
        List<String> sensitiveWord1 = WordFilter.getSensitiveWord(context, 1);
        System.out.println(sensitiveWord1);
        System.out.println(sensitiveWord);
    }
}
