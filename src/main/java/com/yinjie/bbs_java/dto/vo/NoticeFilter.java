package com.yinjie.bbs_java.dto.vo;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class NoticeFilter {

    private String title;

    private String creatorId;

    private String startTime;

    private String endTime;
}
