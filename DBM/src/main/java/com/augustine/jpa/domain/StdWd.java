package com.augustine.jpa.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.augustine.jpa.code.RegStatCd;
import com.augustine.jpa.code.Yn;

import lombok.Data;

/**
 * Standard word domain class
 * @author augustine
 *
 */
@Data
@Entity
@Table(name="STD_WD")
public class StdWd {

	@Id
	@Column(name="WD_SEQ",nullable = false)
	private Long wdSeq;
	
	@Column(name="KOR_NM", nullable = false, length=100)
	private String korNm;
	
	@Column(name="ENG_NM", length=100)
	private String engNm;
	
	@Column(name="WD_DEFIN")
	private String wdDefin;
	
	@Column(name="WD_ABBREVI_NM", length=100)
	private String wdAbbreviNm;
	
	@Column(name="REG_STAT_CD")
	@Enumerated(EnumType.STRING)
	private RegStatCd regStatCd;
	
	@Column(name="CREATOR_SEQ")
	private Long creatorSeq;
	
	@Column(name="CRE_DT")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creDt;
	
	@Column(name="DEL_YN", columnDefinition = "CHAR(1) default 'N'")
	@Enumerated(EnumType.STRING)
	private Yn delYn;
		
}
