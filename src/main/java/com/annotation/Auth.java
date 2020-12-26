package com.annotation;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.PARAMETER;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ METHOD, PARAMETER })
@Retention(RetentionPolicy.RUNTIME)
public @interface Auth {
	// 구분자로 권한필요한 것 확인
	public String flag() default "user";
}