<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
	<typeHandlers>
	<#list columns as column>
	<#if column.colComment?index_of('enum:') gte 0>
		<typeHandler javaType="${enumPackage}.${column.beanField?cap_first}Enum" handler="org.apache.ibatis.type.EnumOrdinalTypeHandler"/>
	</#if>
	</#list>
	</typeHandlers>
</configuration>