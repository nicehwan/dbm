package com.augustine.jpa;

/**
 * Class for Code Data
 * @author augustine
 * @version 1.0
 */
public class CodeData {
	private String code;
	private String codeName;
	private String mlangCdNm;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public String getMlangCdNm() {
		return this.mlangCdNm;
	}

	public void setMlangCdNm(String mlangCdNm) {
		this.mlangCdNm = mlangCdNm;
	}
}
