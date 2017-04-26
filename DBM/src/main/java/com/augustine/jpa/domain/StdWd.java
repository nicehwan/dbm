package com.augustine.jpa.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.augustine.jpa.code.RegStatCd;
import com.augustine.jpa.code.Yn;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

/**
 * Standard word domain class
 * @author augustine
 *
 */
@Data
@Entity
@Table(name="STD_WD")
@SequenceGenerator(name = "seqgen_std_wd", sequenceName = "seq_std_wd", initialValue = 1000, allocationSize = 1)
public class StdWd {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seqgen_std_wd")
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
	
	@OneToMany(mappedBy = "stdWd")
	@JsonIgnore
	private List<StdWdSyno> stdWdSynos = new ArrayList<>(1);
	
	@OneToMany(mappedBy = "stdWd")
	@JsonIgnore
	private List<VocaWdAsmble> vocaWdAsmbles = new ArrayList<>(1);
	
	@OneToMany(mappedBy = "stdWd")
	@JsonIgnore
	private List<MetaDataRelationer> metaDataRelationers = new ArrayList<>(1);
}
