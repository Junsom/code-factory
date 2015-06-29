package ${servicePackage};

import ${entityPackage}.${voName};
import cn.com.dhc.ec.fw.common.page.Pagination;
import java.util.List;

public interface ${serviceName} {

	/**
     * 根据id取得<#if tableComment?? && tableComment?length &gt; 0>${tableComment}<#else>${entityName?uncap_first}对象</#if>
     * @param  id
     * @return
     */
     public ${voName} get${voName}ById(Long id);

	/**
     * 根据id取得<#if tableComment?? && tableComment?length &gt; 0>${tableComment}<#else>${entityName?uncap_first}对象</#if>
     * @param  id
     * @return
     */
     public List<${voName}> getAll();

	/**
     * 根据${voName}对象分页查询
     * @param  ${voName?uncap_first}
     * @return
     */
     public Pagination<Map<String, Object>> get${voName}ListByConditions(Pagination<Map<String, Object>> pager);
    
    /**
     * 保存<#if tableComment?? && tableComment?length &gt; 0>${tableComment}<#else>${entityName?uncap_first}对象</#if>
     * @param  ${voName?uncap_first}
     * @return
     */
     public Long add${voName}(${voName} ${voName?uncap_first});
     
     /**
     * 更新<#if tableComment?? && tableComment?length &gt; 0>${tableComment}<#else>${entityName?uncap_first}对象</#if>
     * @param  ${voName?uncap_first}
     * @return
     */
     public Integer update${voName}(${voName} ${voName?uncap_first});
     
     /**
     * 根据id删除<#if tableComment?? && tableComment?length &gt; 0>${tableComment}<#else>${entityName?uncap_first}对象</#if>
     * @param  id
     * @return
     */
     public Integer  delete${voName}(Long id);
}