package com.javaee.bean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Write_history {
	
	public void writeFileByLines(String search_history){
			if(search_history==null) search_history="";
			else
	    	try {  
	            //打开一个写文件器，构造函数中的第二个参数true表示以追加形式写文件  
	    		String filepath = "D:\\eclipse javaEE\\my\\WebContent\\history.txt";
	    		File file = new File(filepath);
	    		if(!file.exists()) file.createNewFile();
	            FileWriter writer = new FileWriter(filepath, true);  
	            writer.write(search_history+"\n");
	            writer.close();
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        }  
		}
	public static void main(String []args)
	{
		Write_history Wh = new Write_history();
		Wh.writeFileByLines("我的");
	}
}
