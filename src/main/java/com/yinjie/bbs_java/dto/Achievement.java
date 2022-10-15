package com.yinjie.bbs_java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Achievement {

    private Long articleCount;

    private Long answerCount;

    private Long approves;
}
