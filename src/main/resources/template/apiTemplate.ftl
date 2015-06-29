package ${apiPackage};

import javax.annotation.Resource;

import com.alibaba.dubbo.config.annotation.Service;
import ${namespacePackage}.${serviceName};
import ${entityPackage}.${voName};


public interface ${apiName}{
    
    /**
     * 根据id取得<#if tableComment?? && tableComment?length &gt; 0>${tableComment}<#else>${entityName?uncap_first}对象</#if>
     * @param  id
     * @return
     */
    public ${voName} get${voName}ById(Long id);
    
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

}