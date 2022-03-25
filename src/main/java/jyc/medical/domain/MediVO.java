package jyc.medical.domain;

import lombok.Data;

@Data
public class MediVO {
	
	private String category;
	private String schType;
	
	private int cycleYear;
	private int cycleMonth;
	private int cycleWeek;
	private int cycleDay;
	
}
