package com.yinjie.bbs_java.util;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import java.util.Collections;

public class CodeGenerate {
    public static void main(String[] args) {
        FastAutoGenerator.create("jdbc:mysql://localhost:3306/bbs?useUnicode=true&characterEncoding=utf8", "root", "123")
                .globalConfig(builder -> {
                    builder.author("Jack") // 设置作者
                            .enableSwagger() // 开启 swagger 模式
                            .commentDate("yyyy-MM-dd HH:mm:ss")
//                            .fileOverride() // 覆盖已生成文件
                            .disableOpenDir()
                            .outputDir("E:\\Download\\bbs-developer-forum-system-develop\\src\\main\\java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("com.yinjie.bbs_java") // 设置父包名
//                            .moduleName("test") // 设置父包模块名
                            .entity("entity")
                            .service("service")
                            .serviceImpl("service.impl")
                            .controller("controller")
                            .mapper("mapper")
//                            .xml("mapper")
                            .pathInfo(Collections.singletonMap(OutputFile.mapperXml, "E:\\Download\\bbs-developer-forum-system-develop\\src\\main\\resources\\mapper")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("bbs_notice")//哪个表
                            .addTablePrefix("bbs_")
                            .serviceBuilder()
                            .formatServiceFileName("%sService")//不加%s类名默认前面加个I,即IService
                            .formatServiceImplFileName("%sServiceImpl")
                            .entityBuilder()
                            .enableLombok()
                            .logicDeleteColumnName("deleted")
                            .enableTableFieldAnnotation()
                            .controllerBuilder()
                            .formatFileName("%sController")
                            .mapperBuilder()
                            .superClass(BaseMapper.class)
                            .formatMapperFileName("%sMapper")
                            .enableMapperAnnotation()
                            .formatXmlFileName("%sMapper"); // 设置需要生成的表名
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }
}
