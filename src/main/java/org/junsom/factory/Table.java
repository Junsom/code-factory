package org.junsom.factory;

import java.util.List;
import java.util.Map;

public class Table {

    private String                           namespacePackage;
    private String                           voName;
    private String                           entityPackage;
    private String                           apiPackage;
    private String                           daoName;
    private String                           entityName;
    private String                           resultMapId;
    private String                           keyColumn;
    private String                           tableName;
    private List<Column>                     columns;
    private String                           tableComment;
    private String                           sessionFactoryBeanName;
    private String                           apiName;
    private String                           daoPackage;
    private String                           serviceName;
    private String                           servicePackage;
    private Map<String, Map<String, String>> enumMap;
    private String                           enumPackage;
    private String                           enumName;

    public String getEnumName() {
        return enumName;
    }

    public void setEnumName(String enumName) {
        this.enumName = enumName;
    }

    public List<Column> getColumns() {
        return columns;
    }

    public void setColumns(List<Column> columns) {
        this.columns = columns;
    }

    public String getResultMapId() {
        return resultMapId;
    }

    public void setResultMapId(String resultMapId) {
        this.resultMapId = resultMapId;
    }

    public String getKeyColumn() {
        return keyColumn;
    }

    public void setKeyColumn(String keyColumn) {
        this.keyColumn = keyColumn;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getNamespacePackage() {
        return namespacePackage;
    }

    public void setNamespacePackage(String namespacePackage) {
        this.namespacePackage = namespacePackage;
    }

    public String getEntityPackage() {
        return entityPackage;
    }

    public void setEntityPackage(String entityPackage) {
        this.entityPackage = entityPackage;
    }

    public String getDaoName() {
        return daoName;
    }

    public void setDaoName(String daoName) {
        this.daoName = daoName;
    }

    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public String getTableComment() {
        return tableComment;
    }

    public void setTableComment(String tableComment) {
        this.tableComment = tableComment;
    }

    public String getSessionFactoryBeanName() {
        return sessionFactoryBeanName;
    }

    public void setSessionFactoryBeanName(String sessionFactoryBeanName) {
        this.sessionFactoryBeanName = sessionFactoryBeanName;
    }

    public String getApiName() {
        return apiName;
    }

    public void setApiName(String apiName) {
        this.apiName = apiName;
    }

    public String getDaoPackage() {
        return daoPackage;
    }

    public void setDaoPackage(String daoPackage) {
        this.daoPackage = daoPackage;
    }

    public String getServicePackage() {
        return servicePackage;
    }

    public void setServicePackage(String servicePackage) {
        this.servicePackage = servicePackage;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getApiPackage() {
        return apiPackage;
    }

    public void setApiPackage(String apiPackage) {
        this.apiPackage = apiPackage;
    }

    public String getEnumPackage() {
        return enumPackage;
    }

    public void setEnumPackage(String enumPackage) {
        this.enumPackage = enumPackage;
    }

    public Map<String, Map<String, String>> getEnumMap() {
        return enumMap;
    }

    public void setEnumMap(Map<String, Map<String, String>> enumMap) {
        this.enumMap = enumMap;
    }

    public String getVoName() {
        return voName;
    }

    public void setVoName(String voName) {
        this.voName = voName;
    }

}
