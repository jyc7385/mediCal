package jyc.medical.service;

import java.util.List;

import jyc.medical.domain.Criteria;
import jyc.medical.domain.ListVO;
import jyc.medical.domain.MediVO;

public interface ListService {

	public void register(ListVO list);
	
	public ListVO get(String id, String schType);
	
	public boolean modify(ListVO list);
	
	public boolean remove(String id, String schType);
	
	public List<ListVO> getList(String id, Criteria cri);
	
	public int getTotal(String id, Criteria cri);
	
	public List<MediVO> getMediList();
	
	public int schTypeCheck(String id, String schType);
	
	public String manual();
	
}
