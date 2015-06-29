package org.junsom.main;

import org.junsom.factory.MapperFactory;

/**
 * 主函数
 * 
 * @author junsom
 *
 */
public class Run {

    public static void main(String[] args) {
        MapperFactory factory = new MapperFactory();
        factory.mapper();
    }

}
