package jyc.medical.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat; // For @DateTimeFormat

import lombok.Data;

@Data
public class ListVO {

	private String id;
	private String schType;
	private String memo;
	private String regType;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate takeDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate possDate;
	
	private int cycleYear;
	private int cycleMonth;
	private int cycleWeek;
	private int cycleDay;
	
}
