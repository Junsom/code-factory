<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<#macro mapperEl value>${r"#{"}${value}}</#macro>
<#if keyColumn??>
	<#list columns as column>
		<#if column.dbColumn == keyColumn><#assign beanKeyField = column.beanField></#if>
	</#list>
</#if> 
<mapper namespace="${namespacePackage}.${daoName}">
	<resultMap id="${resultMapId}" type="${entityPackage}.${entityName}">
		<#list columns as column>
			<#if column.colComment?index_of('enum:') gte 0>
			<result property="${column.beanField}Enum" column="${column.dbColumn}" />
			<#else>
			<result property="${column.beanField}" column="${column.dbColumn}" />	
			</#if>
		</#list>
	</resultMap>
	<sql id="selectAllColumns">
	<![CDATA[	
		select
		<#list columns as column>${column.dbColumn}<#if column_index != (columns?size - 1)>,</#if></#list>
		from ${tableName}	  
	]]>
	</sql>
	<sql id="entityWhereCase">
		1 = 1 
		<#list columns as column>
		<#if "java.lang.String" = column.colJavaType>
		<if test='${column.dbColumn} != null && ${column.dbColumn} !=""'>
			and ${column.dbColumn} = ${"#"}{${column.dbColumn}}
		</if>
		<#else>
		<if test="${column.dbColumn} != null">
			and ${column.dbColumn} = ${"#"}{${column.dbColumn}}
		</if>
		</#if>
		</#list>
	</sql>
	<sql id="prefixEntityWhereCase">
		1 = 1 
		<#list columns as column>
		<#if "java.lang.String" = column.colJavaType>
		<if test='entityCondition.${column.dbColumn} != null && entityCondition.${column.dbColumn} !=""'>
			and entityCondition.${column.dbColumn} = ${"#"}{entityCondition.${column.dbColumn}}
		</if>
		<#else>
		<if test="entityCondition.${column.dbColumn} != null">
			and entityCondition.${column.dbColumn} = ${"#"}{entityCondition.${column.dbColumn}}
		</if>
		</#if>
		</#list>
	</sql>
	<sql id="pageWhereCase">
		limit pageable.startIndex,pageable.pageSize 
	</sql>
	
	<select id="selectById" parameterType="Long" resultMap="${resultMapId}">
	    <include refid="selectAllColumns" />
		<#if keyColumn??>
		 where ${keyColumn} = ${r"#{"}id${r"}"}
		</#if>
	</select>
	
	<select id="selectByEntityCondition" parameterType="${entityPackage}.${entityName}" resultMap="${resultMapId}">
		<include refid="selectAllColumns" /> where <include refid="entityWhereCase" />
	</select>
	
	<select id="selectByEntityConditionPage" parameterType="${entityPackage}.${entityName}" resultMap="${resultMapId}">
		<include refid="selectAllColumns" /> where <include refid="prefixEntityWhereCase" /> and <include refid="pageWhereCase" /> order by ${keyColumn} desc
	</select>
			
	<#if keyColumn??>
	<update id="update" parameterType="${entityPackage}.${entityName}">
	<![CDATA[
		update ${tableName} set  
		<#list columns as column><#if column.colComment?index_of('enum:') gte 0>${column.dbColumn}= ${r"#{"}${column.beanField}Enum${r"}"}<#if column_index != (columns?size - 1)>,</#if><#elseif column.dbColumn=="create_time" || column.dbColumn="create_user"><#elseif column.dbColumn=="modify_time">${column.dbColumn}= now()<#if column_index != (columns?size - 1)>,</#if><#else>${column.dbColumn}= ${r"#{"}${column.beanField}${r"}"}<#if column_index != (columns?size - 1)>,</#if></#if></#list>
		where ${keyColumn} = <@mapperEl beanKeyField/>
	]]>
	</update>
	
	<insert id="insert" parameterType="${entityPackage}.${entityName}" useGeneratedKeys="true" keyProperty="${beanKeyField}" keyColumn="${keyColumn}">
	<![CDATA[
		insert into ${tableName}(<#list columns as column><#if column.dbColumn != keyColumn>${column.dbColumn}<#if column_index != (columns?size - 1)>,</#if></#if></#list>)
		values(<#list columns as column><#if column.dbColumn != keyColumn><#if column.colComment?index_of('enum:') gte 0>${r"#{"}${column.beanField}Enum${r"}"}<#if column_index != (columns?size - 1)>,</#if><#elseif column.dbColumn=="create_time" || column.dbColumn=="modify_time">now()<#if column_index != (columns?size - 1)>,</#if><#else>${r"#{"}${column.beanField}${r"}"}<#if column_index != (columns?size - 1)>,</#if></#if></#if></#list>)
	]]>
	</insert>
	</#if>
	
	 <!-- 根据主键删除一条记录 -->  
    <delete id="deleteById" parameterType="Long">  
    <![CDATA[
        delete from ${tableName} where ${keyColumn!} = <@mapperEl beanKeyField/>
    ]]>
    </delete>
    <delete id="deleteByIds">
    	delete from ${tableName} where ${keyColumn!} in 
    	<foreach collection="ids" item="id" open="(" close=")" separator=",">
    		${"#"}{id}
    	</foreach>
    </delete>
</mapper>
