package org.junsom.factory;

public class Column {

  private String dbColumn;
  private String beanField;
  private String colJavaType;
  private String colDbType;
  private String colComment;
  private String isNullable;
  private Long   characterMaximumLength;

  public String getColJavaType() {
    return colJavaType;
  }

  public void setColJavaType(String colJavaType) {
    this.colJavaType = colJavaType;
  }

  public String getDbColumn() {
    return dbColumn;
  }

  public void setDbColumn(String dbColumn) {
    this.dbColumn = dbColumn;
  }

  public String getBeanField() {
    return beanField;
  }

  public void setBeanField(String beanField) {
    this.beanField = beanField;
  }

  public String getColDbType() {
    return colDbType;
  }

  public void setColDbType(String colDbType) {
    this.colDbType = colDbType;
  }

  public String getColComment() {
    return colComment;
  }

  public void setColComment(String colComment) {
    this.colComment = colComment;
  }

  public String getIsNullable() {
    return isNullable;
  }

  public void setIsNullable(String isNullable) {
    this.isNullable = isNullable;
  }

  public Long getCharacterMaximumLength() {
    return characterMaximumLength;
  }

  public void setCharacterMaximumLength(Long characterMaximumLength) {
    this.characterMaximumLength = characterMaximumLength;
  }

}
