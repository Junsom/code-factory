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
    public List<${entityName}> getAll(){
    	List<${entityName}> ${entityName?uncap_first}List = ${daoName?uncap_first}.getAll();
    	List<${entityName}> ${entityName?uncap_first}List = new ArrayList<${entityName}>();
    	for(${entityName} entity : ${entityName?uncap_first}List){
    		${entityName?uncap_first}List.add(this.entity2vo(entity));
    	}
		return ${entityName?uncap_first}List;
    }

    @Override
    public Pagination<Map<String, Object>> get${entityName}ListByConditions(Pagination<Map<String, Object>> pager) {
		List<${entityName}> ${entityName?uncap_first}List = ${daoName?uncap_first}.get${entityName}ListByConditions(pager, pager.getCondition());
		Long totalList = ${daoName?uncap_first}.get${entityName}CountsByConditions(pager.getCondition());
    	List<${entityName}> ${entityName?uncap_first}List = new ArrayList<${entityName}>();
    	for(${entityName} entity : ${entityName?uncap_first}List){
    		${entityName?uncap_first}List.add(this.entity2vo(entity));
    	}
    	pager.setData(${entityName?uncap_first}List);
    	pager.setRecordsTotal(totalList.intValue());
		return pager;
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
     
     private ${entityName} entity2vo(${entityName} ${entityName?uncap_first}){
     	//TODO 此处需要将entity转换成VO
     	if(${entityName?uncap_first} == null){
     		return null;
     	}
     	${entityName} ${entityName?uncap_first} = new ${entityName}();
     	BeanUtils.copyProperties(${entityName?uncap_first}, ${entityName?uncap_first});
     	return ${entityName?uncap_first};
     }
     
     private ${entityName} vo2entity(${entityName} ${entityName?uncap_first}){
     	//TODO 此处需要将VO转换成entity
     	if(${entityName?uncap_first} == null){
     		return null;
     	}
     	${entityName} ${entityName?uncap_first} = new ${entityName}();
     	BeanUtils.copyProperties(${entityName?uncap_first}, ${entityName?uncap_first});
     	return ${entityName?uncap_first};
     }
}