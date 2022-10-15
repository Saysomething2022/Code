package com.yinjie.bbs_java.dto.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ArticleTypeFilter {

    private String type;

    private String creatorId;

    private String startTime;

    private String endTime;
}
