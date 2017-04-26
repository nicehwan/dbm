package com.augustine.jpa.code;

import java.util.ArrayList;
import java.util.List;

import com.augustine.jpa.CodeData;
/**
 * <pre>
 * 	Code for Register State of standard metadata
 *  ING, ACTIVE, TERMINAT
 * </pre> 
 * @author augustine
 *
 */
public enum RegStatCd {
	ING, ACTIVE, TERMINAT;
	
	public String getName(){
		switch(this){
			case ING 		: return "신청";
			case ACTIVE 	: return "활성";
			case TERMINAT 	: return "폐기";
			default 		: return null;
		}		
	}
	
	public String getResourceBundleKey(){
		switch(this){
			case ING 		: return "common.code.regstatcd.ING";
			case ACTIVE 	: return "common.code.regstatcd.ACTIVE";
			case TERMINAT 	: return "common.code.regstatcd.TERMINAT";
			default 		: return null;
		}
	}
	
	final static public List<CodeData> getCodeData(){
		List <CodeData> codeList = new ArrayList<CodeData>(RegStatCd.values().length);
		
		for(RegStatCd cd : RegStatCd.values()){
			CodeData data = new CodeData();
			data.setCode(cd.toString());
			data.setMlangCdNm(cd.getResourceBundleKey());
			data.setCodeName(cd.getName());
			codeList.add(data);	
		}
		
		return codeList;
	}

}
