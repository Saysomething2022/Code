package com.yinjie.bbs_java.aspect;

import com.yinjie.bbs_java.annotation.Systemlog;
import com.yinjie.bbs_java.entity.SystemLog;
import com.yinjie.bbs_java.service.SystemLogService;
import com.yinjie.bbs_java.util.JwtUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.net.Inet4Address;
import java.net.UnknownHostException;

@Aspect
@Component
@Order(-1)
public class SystemAspect {

    @Autowired
    private SystemLogService SystemLogService;

    @Autowired
    private RedisTemplate redisTemplate;
    //定义一个切入点
    @Pointcut("@annotation(com.yinjie.bbs_java.annotation.Systemlog)")
    public void operLog() {
    }

    @AfterReturning(pointcut = "operLog()", returning = "result")
    public void doAfterReturning(JoinPoint joinPoint, Object result) throws UnknownHostException {
        saveLog(joinPoint, result, null);
    }
    public void saveLog(JoinPoint joinPoint,Object result,Exception e) throws UnknownHostException {
        // 获取reques对象
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = (attributes == null ? null : attributes.getRequest());
        String url = request.getServletPath();
        //构造系统日志
        SystemLog SystemLog = new SystemLog();
        JwtUtils jwtUtils = new JwtUtils();
        System.out.println(redisTemplate);
        String userId = (String) redisTemplate.opsForValue().get("userId");
        System.out.println(userId);
        if(userId != null){
            SystemLog.setUid(userId);
        }else {
            SystemLog.setUid("游客");
        }

        SystemLog.setIp(Inet4Address.getLocalHost().getHostAddress());
        SystemLog.setUrl(url);
        // 记录请求路径、请求描述
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        SystemLog.setMethodName(String.valueOf(signature));
        Method method = signature.getMethod();
        if (method != null){
            Systemlog SystemLog1 = (Systemlog) method.getAnnotation(Systemlog.class);
            if (SystemLog1 != null){
                SystemLog.setDescribe(SystemLog1.desc());
            }
        }

        System.out.println(SystemLog);
        SystemLogService.save(SystemLog);

    }

}
