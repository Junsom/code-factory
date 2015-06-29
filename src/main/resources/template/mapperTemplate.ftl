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
	<select id="get" parameterType="Long" resultMap="${resultMapId}">
	    <include refid="selectAllColumns" />
		<#if keyColumn??>
		 where ${keyColumn} = ${r"#{"}id${r"}"}
		</#if>
	</select>

	<select id="getAll" resultMap="${resultMapId}">
		<include refid="selectAllColumns" />
	</select>
	
	<select id="get${entityName}ListByConditions" <#--parameterType="${entityPackage}.${entityName?uncap_first}"--> resultMap="${resultMapId}">
		<include refid="selectAllColumns" />
			where 1=1
		<#list columns as column>				
				<#if column.colJavaType=="java.lang.String">
		<if test="params.${column.beanField} !=null and params.${column.beanField} !=''">
			and ${column.dbColumn} = ${r"#{"}params.${column.beanField}${r"}"}  
		</if> 
				</#if>
				<#if column.colJavaType=="java.lang.Integer">
			<#if column.colComment?index_of('enum:') gte 0>
		<if test="params.${column.beanField}Enum !=null">
			and ${column.dbColumn} = ${r"#{"}params.${column.beanField}Enum${r"}"}
			<#else>
		<if test="params.${column.beanField} !=null">
			and ${column.dbColumn} = ${r"#{"}params.${column.beanField}${r"}"}
			</#if>  
		</if>					
				</#if>
				<#if column.colJavaType=="java.math.BigDecimal">
		<if test="params.${column.beanField} !=null">
			and ${column.dbColumn} = ${r"#{"}params.${column.beanField}${r"}"}  
		</if>				
				</#if>
				<#if column.colJavaType=="java.util.Date">
		<if test="params.${column.beanField} !=null">
			and ${column.dbColumn} = ${r"#{"}params.${column.beanField}${r"}"}  
		</if>				
				</#if>
				<#if column.colJavaType=="java.lang.Long">
		<if test="params.${column.beanField} !=null">
			and ${column.dbColumn} = ${r"#{"}params.${column.beanField}${r"}"}  
		</if>				
				</#if>	
				<#if column.colJavaType=="java.lang.Boolean">
		<if test="params.${column.beanField} !=null">
			and ${column.dbColumn} = ${r"#{"}params.${column.beanField}${r"}"}  
		</if>				
				</#if>																						
		</#list>
			<![CDATA[	limit ${r"#{"}pager.startIndex${r"}"},${r"#{"}pager.pageSize${r"}"}]]> 
	</select>	
	<select id="get${entityName}CountsByConditions"  resultType="Long">
		<![CDATA[	select count(*) from ${tableName} ]]> 
			where 1=1
		<#list columns as column>				
				<#if column.colJavaType=="java.lang.String">
		<if test="params.${column.beanField} !=null and params.${column.beanField} !=''">
			and ${column.dbColumn} = ${r"#{"}params.${column.beanField}${r"}"}  
		</if> 
				</#if>
				<#if column.colJavaType=="java.lang.Integer">
			<#if column.colComment?index_of('enum:') gte 0>
		<if test="params.${column.beanField}Enum !=null">
			and ${column.dbColumn} = ${r"#{"}params.${column.beanField}Enum${r"}"}
			<#else>
		<if test="params.${column.beanField} !=null">
			and ${column.dbColumn} = ${r"#{"}params.${column.beanField}${r"}"}
			</#if>  
		</if>					
				</#if>
				<#if column.colJavaType=="java.math.BigDecimal">
		<if test="params.${column.beanField} !=null">
			and ${column.dbColumn} = ${r"#{"}params.${column.beanField}${r"}"}  
		</if>				
				</#if>
				<#if column.colJavaType=="java.util.Date">
		<if test="params.${column.beanField} !=null">
			and ${column.dbColumn} = ${r"#{"}params.${column.beanField}${r"}"}  
		</if>				
				</#if>
				<#if column.colJavaType=="java.lang.Long">
		<if test="params.${column.beanField} !=null">
			and ${column.dbColumn} = ${r"#{"}params.${column.beanField}${r"}"}  
		</if>				
				</#if>	
				<#if column.colJavaType=="java.lang.Boolean">
		<if test="params.${column.beanField} !=null">
			and ${column.dbColumn} = ${r"#{"}params.${column.beanField}${r"}"}  
		</if>				
				</#if>																						
		</#list>
	</select>			
	<#if keyColumn??>
	<update id="update" parameterType="${entityPackage}.${entityName}">
		<![CDATA[
		update ${tableName} set  
		<#list columns as column><#if column.colComment?index_of('enum:') gte 0>${column.dbColumn}= ${r"#{"}${column.beanField}Enum${r"}"}<#if column_index != (columns?size - 1)>,</#if><#elseif column.dbColumn=="create_time" || column.dbColumn="create_user"><#elseif column.dbColumn=="modify_time">${column.dbColumn}= now()<#if column_index != (columns?size - 1)>,</#if><#else>${column.dbColumn}= ${r"#{"}${column.beanField}${r"}"}<#if column_index != (columns?size - 1)>,</#if></#if></#list>
		where ${keyColumn} = <@mapperEl beanKeyField/>
		]]>
	</update>
	
	<#--
	<update id="updateNotNull" parameterType="${entityPackage}.${entityName?uncap_first}">
        update ${tableName} 
    	<set>
    		<#list columns as column>
				<if test="${column.beanField} != null">${column.dbColumn}= <@mapperEl column.beanField/><#if column_index != (columns?size - 1)>,</#if></if>
			</#list>
	    </set>
        where ${keyColumn} = <@mapperEl beanKeyField/>
	</update>
	-->
	
	<insert id="insert" parameterType="${entityPackage}.${entityName}" useGeneratedKeys="true" keyProperty="${beanKeyField}" keyColumn="${keyColumn}">
	<![CDATA[
		insert into ${tableName}(<#list columns as column><#if column.dbColumn != keyColumn>${column.dbColumn}<#if column_index != (columns?size - 1)>,</#if></#if></#list>)
		values(<#list columns as column><#if column.dbColumn != keyColumn><#if column.colComment?index_of('enum:') gte 0>${r"#{"}${column.beanField}Enum${r"}"}<#if column_index != (columns?size - 1)>,</#if><#elseif column.dbColumn=="create_time" || column.dbColumn=="modify_time">now()<#if column_index != (columns?size - 1)>,</#if><#else>${r"#{"}${column.beanField}${r"}"}<#if column_index != (columns?size - 1)>,</#if></#if></#if></#list>)
	]]>
	</insert>
	</#if>
	
	 <!-- 根据主键删除一条记录 -->  
    <delete id="delete" parameterType="Long">  
    <![CDATA[
        delete from ${tableName} where ${keyColumn!} = <@mapperEl beanKeyField/>
    ]]>
    </delete> 
	<#-- 
	<select id="list" parameterType="${entityPackage}.${entityName?uncap_first}" resultMap="${resultMapId}">
		select
		<#list columns as column>
			${column.dbColumn}<#if column_index != (columns?size - 1)>,</#if>
		</#list>
		from ${tableName}
		<where>
			<#list columns as column>
				<if test="${column.beanField} != null">and ${column.dbColumn}= <@mapperEl column.beanField/></if>
			</#list>
		</where>
	</select>
	-->
</mapper>