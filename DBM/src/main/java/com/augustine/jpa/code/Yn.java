package com.augustine.jpa.code;

import java.util.ArrayList;
import java.util.List;

import com.augustine.jpa.CodeData;

public enum Yn {
	Y, N;
	
	public String getName(){
		switch(this){
			case Y : return "예";
			case N : return "아니오";
			default : return null;
		}
	}
	
	
	public String getResourceBundleKey(){
		switch(this){
			case Y : return "common.code.yn.Y";
			case N : return "common.code.yn.N";
			default : return null;
		}
	}
	
	final static public List<CodeData> getCodeData(){
		List <CodeData> codeList = new ArrayList<CodeData>(Yn.values().length);
		
		for(Yn cd : Yn.values()){
			CodeData data = new CodeData();
			data.setCode(cd.toString());
			data.setMlangCdNm(cd.getResourceBundleKey());
			data.setCodeName(cd.getName());
			codeList.add(data);	
		}
		
		return codeList;
	}
}
