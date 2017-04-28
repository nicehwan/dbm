package com.augustine.jpa.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.augustine.jpa.code.Yn;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

/**
 * Standard Word Synonym Domain class
 * @author augustine
 * @version 1.0
 */
@Data
@Entity
@Table(name = "STD_WD_SYNO")
@SequenceGenerator(name = "seqgen_std_wd_syno", sequenceName = "", initialValue = 1000, allocationSize = 1)
public class StdWdSyno {

	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonBackReference
	@JsonIgnore
	@JoinColumn(name = "WD_SEQ", nullable = false)
	private StdWd stdWd;
	
	@Column(name = "SYNO_KOR_NM", length = 100)
	private String synoKorNm;
	
	@Column(name = "DEL_YN", columnDefinition = "CHAR(1) default 'N'")
	@Enumerated(EnumType.STRING)
	private Yn delYn;
	
	@Column(name = "CREATOR_SEQ")
	private Long creatorSeq;
	
	@Column(name="CRE_DT")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creDt;
}
