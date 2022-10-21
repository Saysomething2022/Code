package com.yinjie.bbs_java.dto.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ArticleFilter {

    private String author;

    private String content;

    private String startTime;

    private String endTime;
}
