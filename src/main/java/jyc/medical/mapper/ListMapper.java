package jyc.medical.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jyc.medical.domain.Criteria;
import jyc.medical.domain.ListVO;
import jyc.medical.domain.MediVO;

public interface ListMapper {

	public List<ListVO> getList();
	
	public List<ListVO> getListWithPaging(@Param("id") String id, @Param("cri") Criteria cri);

	public void insert(ListVO list);
	
	public ListVO read(@Param("id") String id, @Param("schType") String schType);
	
	public int delete(@Param("id") String id, @Param("schType") String schType);
	
	public int update(ListVO list);
	
	// For count pages
	public int getTotalCount(@Param("id") String id, @Param("cri") Criteria cri);
	
	// For medi list
	public List<MediVO> getMediList();
	
	// Check Type
	public int schTypeCheck(@Param("id") String id, @Param("schType") String schType);
		
	// Manual
	public String manual();
	
}
