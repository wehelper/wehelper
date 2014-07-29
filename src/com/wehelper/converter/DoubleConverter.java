package com.wehelper.converter;

import org.springframework.core.convert.converter.Converter;


public class DoubleConverter implements Converter<String, Double>{

	@Override
	public Double convert(String source) {
		if (source == null ||source.trim().equals("")){
			return (double) 0;
		}else{
			try{
				return Double.parseDouble(source);
			}catch (Exception e) {
				return (double) 0;
				//throw new IllegalArgumentException(String.format("价钱格式出错了"));
			}
		}
	}
    
	
}