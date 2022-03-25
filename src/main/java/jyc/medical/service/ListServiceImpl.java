package jyc.medical.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import jyc.medical.domain.Criteria;
import jyc.medical.domain.ListVO;
import jyc.medical.domain.MediVO;
import jyc.medical.mapper.ListMapper;
import lombok.AllArgsConstructor;
// import lombok.extern.log4j.Log4j;

// @Log4j
@Service
@AllArgsConstructor
public class ListServiceImpl implements ListService {

	private ListMapper mapper;
	
	@Autowired
	private PasswordEncoder pwencoder;

	@Override
	public void register(ListVO list) {
		
		mapper.insert(list);
		
	}

	@Override
	public ListVO get(String id, String schType) {
		
		return mapper.read(id, schType);
		
	}

	@Override
	public boolean modify(ListVO list) {
		
		return mapper.update(list) == 1;
		
	}

	@Override
	public boolean remove(String id, String schType) {

		return mapper.delete(id, schType) == 1;
		
	}

	@Override
	public List<ListVO> getList(String id, Criteria cri) {
		
		return mapper.getListWithPaging(id, cri);
		
	}
	
	@Override
	public int getTotal(String id, Criteria cri) {
		
		return mapper.getTotalCount(id, cri);
		
	}
	
	public List<MediVO> getMediList() {
		
		return mapper.getMediList();
		
	}
	
	@Override
	public int schTypeCheck(String id, String schType) { 
		
		return mapper.schTypeCheck(id, schType);
		
	}
		
	@Override
	public String manual() {
		
		return mapper.manual();
		
	}
	
}
