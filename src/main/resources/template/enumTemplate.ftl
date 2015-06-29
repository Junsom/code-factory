package ${enumPackage};

public enum ${enumName}Enum {
<#if enumMap?exists>
          <#list enumMap.get(enumName).keySet() as key>
           	<#if key_index == enumMap.get(enumName).keySet().size() - 1>
    ${key}("${enumMap.get(enumName).get(key)}");
           	<#else>
    ${key}("${enumMap.get(enumName).get(key)}"),
           	</#if>
          </#list>
 </#if> 
 	private String lable;
 	private ${enumName}Enum(String lable){
 		this.lable = lable;
 	}
 	
 	public static String getName(String lable) {
        for (${enumName}Enum c : ${enumName}Enum.values()) {
            if (c.lable.equals(lable)) {
                return c.name();
            }
        }
        return null;
    }

    // 覆盖方法
    @Override
    public String toString() {
       return this.lable;
    }  
 
}