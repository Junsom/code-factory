package ${servicePackage}.impl;

import java.util.List;
import javax.annotation.Resource;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import ${daoPackage}.${daoName};
import ${servicePackage}.${serviceName}; 
import ${entityPackage}.${entityName};

@Service
public class ${serviceName} implements I${serviceName}, ICommonService<${entityName}> throws Exception {
 
  <#assign daoNameUncapFirst="${daoName?uncap_first}">
  <#assign entityNameUncapFirst="${entityName?uncap_first}">
  
  @Resource
  private I${daoName} ${daoNameUncapFirst};
  
  @Override
  public Integer insert(${entityName} ${entityNameUncapFirst}) {
  	Assert.notNull(${entityNameUncapFirst});
  	return ${daoNameUncapFirst}.insert(${entityNameUncapFirst});
  }
  
  /**
   * 根据id删除记录
   * 
   * @param id
   * @return
   */
  public Integer deleteById(Long id) {
  	Assert.notNull(id);
  	return ${daoNameUncapFirst}.deleteById(id);
  }
  
  /**
   * 根据id集合删除记录
   * 
   * @param ids
   * @return
   */
  public Integer deleteByIds(List<Long> ids) {
  	Assert.notNull(ids);
  	Assert.notEmpty(ids);
  	return ${daoNameUncapFirst}.deleteByIds(ids);
  }
  
  /**
   * 更新记录
   * 
   * @param entity
   * @return
   */
  public Integer update(${entityName} ${entityNameUncapFirst}) {
  	Assert.notNull(${entityNameUncapFirst});
  	Assert.notNull(${entityNameUncapFirst}.getId());
  	
  	return ${daoNameUncapFirst}.update(${entityNameUncapFirst});
  }

  /**
   * 根据主键查找
   * 
   * @param id
   * @return
   */
  public ${entityName} selectById(Long id) {
  	Assert.notNull(id);
  	return ${daoNameUncapFirst}.selectById(id);
  }
  
  /**
   * 根据entity中的值查询, 不包含空值
   * 
   * @param entity
   * @return
   */
  List<${entityName}> selectByEntityCondition(${entityName} ${entityNameUncapFirst}Condition) {
  	Assert.notNull(${entityNameUncapFirst}Condition);
  	return ${daoNameUncapFirst}.selectByEntityCondition(${entityNameUncapFirst}Condition);
  }
  
  /**
   * 根据实体中的条件分页查询
   * 
   * @param entityCondition
   * @param pageable
   * @return
   */
  List<${entityName}> selectByEntityConditionPage(${entityName} ${entityNameUncapFirst}Condition, Pageable pageable) {
  	Assert.notNull(${entityNameUncapFirst}Condition);
  	Assert.notNull(pageable);
  	return ${daoNameUncapFirst}.selectByEntityConditionPage(${entityNameUncapFirst}Condition, pageable);
  }
}