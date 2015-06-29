package ${namespacePackage};

import ${entityPackage}.${entityName};
import org.apache.ibatis.annotations.Param;
import cn.com.dhc.ec.fw.common.page.Pagination;
import java.util.List;


public interface ${daoName} {
 
 	<#list columns as column>
 		<#if keyColumn?? && column.dbColumn == keyColumn><#assign keyJavaType=column.colJavaType keyField=column.beanField></#if>
 	</#list>
 	<#if keyColumn??>
 	/**
     * 根据id取得<#if tableComment?? && tableComment?length &gt; 0>${tableComment}<#else>${entityName?uncap_first}对象</#if>
     * @param  ${entityName?uncap_first}Id
     * @return
     */
	${entityName} get(${keyJavaType} ${keyField});
	
	/**
     * 查询全部${entityName}对象
     * @param  ${entityName?uncap_first}Id
     * @return
     */
	List<${entityName}> getAll();

	/**
     * 根据Map<String,Object>对象查询符合条件的总数据数
     * @param  Map对象
     * @return
     */
	Long get${entityName}CountsByConditions(@Param("params") Map<String, Object> params);
	
	/**
     * 根据Map<String,Object>分页查询
     * @param  Map对象
     * @return
     */
	List<${entityName}> get${entityName}ListByConditions(@Param("pager") Pagination<Map<String, Object>> pager, @Param("params") Map<String, Object> params);
		
	/**
     * 保存<#if tableComment?? && tableComment?length &gt; 0>${tableComment}<#else>${entityName?uncap_first}对象</#if>
     * @param  ${entityName?uncap_first}
     * @return
     */
	Long insert(${entityName} ${entityName?uncap_first});
	
	/**
     * 更新<#if tableComment?? && tableComment?length &gt; 0>${tableComment}<#else>${entityName?uncap_first}对象</#if>
     * @param  ${entityName?uncap_first}
     * @return
     */
	 Integer update(${entityName} ${entityName?uncap_first});
	
	/**
     * 根据${entityName?uncap_first}ID删除<#if tableComment?? && tableComment?length &gt; 0>${tableComment}<#else>${entityName?uncap_first}对象</#if>
     * @param  ${entityName?uncap_first}
     * @return
     */
	Integer delete(${keyJavaType} ${keyField});
	<#-- 
	Integer updateNotNull(${entityName} ${entityName?uncap_first});
	-->
 	</#if>
 	<#-- 
 	List<${entityName}> list(${entityName} ${entityName?uncap_first});
 	-->
}