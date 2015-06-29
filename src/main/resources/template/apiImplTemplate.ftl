package ${apiPackage};

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import ${namespacePackage}.${serviceName};
import ${entityPackage}.${voName};


@Service
public class ${apiName}Impl extends BaseApi implements ${apiName}{

    @Resource
    private ${serviceName} ${serviceName?uncap_first};
    

    public ${voName} get${voName}ById(Long id) {
    	return ${serviceName?uncap_first}.get${voName}ById(id);
    }
    

     public Long add${voName}(${voName} ${voName?uncap_first}) {
     	return ${serviceName?uncap_first}.add${voName}(${voName?uncap_first});
     }
     

     public Integer update${voName}(${voName} ${voName?uncap_first}) {
     	return ${serviceName?uncap_first}.update${voName}(${voName?uncap_first});
     }

}