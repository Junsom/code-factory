package ${entityPackage};

 	<#list columns as column>
 		<#if column.colComment?? && column.colComment?length gt 0>
 			<#if column.colComment?index_of('enum:') gte 0>
import ${entityPackage}.${column.beanField?cap_first}Enum; 			
 			</#if>
 		</#if>	
 	</#list>
/**
 * <#if tableComment??>${tableComment}</#if>
 * <p>Table: <strong>${tableName}</strong>
 * <p><table class="er-mapping" cellspacing=0 cellpadding=0 style="border:solid 1 #666;padding:3px;">
 *   <tr style="background-color:#ddd;Text-align:Left;">
 *     <th nowrap>属性名</th><th nowrap>属性类型</th><th nowrap>字段名</th><th nowrap>字段类型</th><th nowrap>说明</th>
 *   </tr>
 <#list columns as column>
 *   <tr><td>${(column.beanField)!}</td><td>{@link ${(column.colJavaType)!}}</td><td>${(column.dbColumn)!}</td><td>${(column.colDbType)!}</td><td><#if column.colComment?? && column.colComment?length gt 0>${(column.colComment)!}<#else>${(column.beanField)!}</#if></td></tr>
 </#list>
 * </table>
 *
 */
public class ${entityName} {
 	
	<#list columns as column>
 		<#if column.colComment?? && column.colComment?index_of('enum:') gte 0>
 			private ${column.beanField?cap_first}Enum ${column.beanField?uncap_first}Enum;
		
 		<#else>
 			private ${column.colJavaType} ${column.beanField};
			
 		</#if>
 		
 	</#list>
 	
 	<#list columns as column>
 		<#if column.colComment?? && column.colComment?index_of('enum:') gte 0>
	 		/**
		     * 获取<#if column.colComment?? && column.colComment?length gt 0>${column.colComment!}<#else>${column.beanField}</#if>
		     */
	 		public ${column.beanField?cap_first}Enum get${column.beanField?cap_first}Enum(){
	 			return this.${column.beanField?uncap_first}Enum;
	 		}
	 		
	 		/**
		     * 设置<#if column.colComment?? && column.colComment?length gt 0>${column.colComment!}<#else>${column.beanField}</#if>
		     */
	 		public void set${column.beanField?cap_first}Enum(${column.beanField?cap_first}Enum ${column.beanField?uncap_first}Enum){
	 			this.${column.beanField?uncap_first}Enum = ${column.beanField?uncap_first}Enum;
	 		} 		
 		<#else>
	 		/**
		     * 获取<#if column.colComment?? && column.colComment?length gt 0>${column.colComment!}<#else>${column.beanField}</#if>
		     */
	 		public ${column.colJavaType} get${column.beanField?cap_first}(){
	 			return this.${column.beanField};
	 		}
	 		
	 		/**
		     * 设置<#if column.colComment?? && column.colComment?length gt 0>${column.colComment!}<#else>${column.beanField}</#if>
		     */
	 		public void set${column.beanField?cap_first}(${column.colJavaType} ${column.beanField}){
	 			this.${column.beanField} = ${column.beanField};
	 		} 				
 		</#if>
 	</#list>
 }