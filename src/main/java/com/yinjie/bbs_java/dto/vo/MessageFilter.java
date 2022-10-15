package com.yinjie.bbs_java.dto.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class MessageFilter {

    private String oriId;

    private String desId;

    private String startTime;

    private String endTime;
}
