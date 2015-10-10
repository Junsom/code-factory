package ${servicePackage}.impl;

import java.util.List;
import javax.annotation.Resource;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import ${daoPackage}.${daoName};
import ${servicePackage}.${serviceName}; 
import ${entityPackage}.${entityName};
import cn.com.dhc.ec.fw.common.page.Pagination;

@Service
public class ${serviceName} implements I${serviceName} {
	
	@Resource
	private ${daoName} ${daoName?uncap_first};
    
    @Override
    public ${entityName} get${entityName}ById(Long id) {
    	return this.entity2vo(${daoName?uncap_first}.get(id));
    }
            
     @Override
     public Long add${entityName}(${entityName} ${entityName?uncap_first}) {
     	
		return ${daoName?uncap_first}.insert(this.vo2entity(${entityName?uncap_first}));
     }
     
     @Override
     public Integer update${entityName}(${entityName} ${entityName?uncap_first}) {
		return ${daoName?uncap_first}.update(this.vo2entity(${entityName?uncap_first}));
     }
     
     @Override
     public Integer delete${entityName}(Long id) {
		return ${daoName?uncap_first}.delete(id);
     }
}