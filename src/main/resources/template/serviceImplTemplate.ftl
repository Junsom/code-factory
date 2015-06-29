package ${servicePackage}.impl;

import java.util.List;
import javax.annotation.Resource;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import ${daoPackage}.${daoName};
import ${servicePackage}.${serviceName}; 
import ${entityPackage}.${voName};
import cn.com.dhc.ec.fw.common.page.Pagination;

@Service
public class ${serviceName}Impl implements ${serviceName} {
	
	@Resource
	private ${daoName} ${daoName?uncap_first};
    
    @Override
    public ${voName} get${voName}ById(Long id) {
    	return this.entity2vo(${daoName?uncap_first}.get(id));
    }

    @Override
    public List<${voName}> getAll(){
    	List<${entityName}> ${entityName?uncap_first}List = ${daoName?uncap_first}.getAll();
    	List<${voName}> ${voName?uncap_first}List = new ArrayList<${voName}>();
    	for(${entityName} entity : ${entityName?uncap_first}List){
    		${voName?uncap_first}List.add(this.entity2vo(entity));
    	}
		return ${voName?uncap_first}List;
    }

    @Override
    public Pagination<Map<String, Object>> get${voName}ListByConditions(Pagination<Map<String, Object>> pager) {
		List<${entityName}> ${entityName?uncap_first}List = ${daoName?uncap_first}.get${entityName}ListByConditions(pager, pager.getCondition());
		Long totalList = ${daoName?uncap_first}.get${entityName}CountsByConditions(pager.getCondition());
    	List<${voName}> ${voName?uncap_first}List = new ArrayList<${voName}>();
    	for(${entityName} entity : ${entityName?uncap_first}List){
    		${voName?uncap_first}List.add(this.entity2vo(entity));
    	}
    	pager.setData(${voName?uncap_first}List);
    	pager.setRecordsTotal(totalList.intValue());
		return pager;
    }
            
     @Override
     public Long add${voName}(${voName} ${voName?uncap_first}) {
     	
		return ${daoName?uncap_first}.insert(this.vo2entity(${voName?uncap_first}));
     }
     
     @Override
     public Integer update${voName}(${voName} ${voName?uncap_first}) {
		return ${daoName?uncap_first}.update(this.vo2entity(${voName?uncap_first}));
     }
     
     @Override
     public Integer delete${voName}(Long id) {
		return ${daoName?uncap_first}.delete(id);
     }
     
     private ${voName} entity2vo(${entityName} ${entityName?uncap_first}){
     	//TODO 此处需要将entity转换成VO
     	if(${entityName?uncap_first} == null){
     		return null;
     	}
     	${voName} ${voName?uncap_first} = new ${voName}();
     	BeanUtils.copyProperties(${entityName?uncap_first}, ${voName?uncap_first});
     	return ${voName?uncap_first};
     }
     
     private ${entityName} vo2entity(${voName} ${voName?uncap_first}){
     	//TODO 此处需要将VO转换成entity
     	if(${voName?uncap_first} == null){
     		return null;
     	}
     	${entityName} ${entityName?uncap_first} = new ${entityName}();
     	BeanUtils.copyProperties(${voName?uncap_first}, ${entityName?uncap_first});
     	return ${entityName?uncap_first};
     }
}