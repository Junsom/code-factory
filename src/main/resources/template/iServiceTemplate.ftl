package ${servicePackage};

import ${entityPackage}.{entityName};
import cn.com.dhc.ec.fw.common.page.Pagination;
import java.util.List;

public interface I${serviceName} {

	/**
     * 根据id取得<#if tableComment?? && tableComment?length &gt; 0>${tableComment}<#else>${entityName?uncap_first}对象</#if>
     * @param  id
     * @return
     */
     public {entityName} get{entityName}ById(Long id);

    /**
     * 保存<#if tableComment?? && tableComment?length &gt; 0>${tableComment}<#else>${entityName?uncap_first}对象</#if>
     * @param  ${entityName?uncap_first}
     * @return
     */
     public Long add{entityName}({entityName} ${entityName?uncap_first});
     
     /**
     * 更新<#if tableComment?? && tableComment?length &gt; 0>${tableComment}<#else>${entityName?uncap_first}对象</#if>
     * @param  ${entityName?uncap_first}
     * @return
     */
     public Integer update{entityName}({entityName} ${entityName?uncap_first});
     
     /**
     * 根据id删除<#if tableComment?? && tableComment?length &gt; 0>${tableComment}<#else>${entityName?uncap_first}对象</#if>
     * @param  id
     * @return
     */
     public Integer  delete{entityName}(Long id);
}