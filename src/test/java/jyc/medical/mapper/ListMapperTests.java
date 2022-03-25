package jyc.medical.mapper;

import java.time.LocalDate;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jyc.medical.domain.Criteria;
import jyc.medical.domain.ListVO;
import jyc.medical.mapper.ListMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
//if use xml setting
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
// else if use java setting
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class ListMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ListMapper mapper;
	
	/*
	@Test
	public void testGetList() {
		mapper.getList().forEach(list -> log.info(list));
	}
	*/
	
	// Insert test
	/*
	@Test
	public void testInsert() {
		ListVO list = new ListVO();
		list.setId("jyc0511");
		list.setMediName("test1");
		LocalDate td = LocalDate.of(2010, 01, 01);
		list.setTakeDate(td);
		list.setPossDate(td.plusMonths(6));
		
		mapper.insert(list);
		
		log.info(list);
	}
	*/
	
	// Read test
	/*
	@Test
	public void testRead() {
		ListVO list = mapper.read("jyc0511", "test1");
		
		log.info(list);
	}
	*/
	
	// Delete test
	/*
	@Test
	public void testDelete() {
		log.info("DELETE COUNT : " + mapper.delete("jyc0511", "test1"));
	}
	*/
	
	// Update test
	/*
	@Test
	public void testUpdate() {
		ListVO list = new ListVO();
		LocalDate td = LocalDate.of(2010, 2, 1);
		list.setId("jyc0511");
		list.setMediName("test1");
		list.setTakeDate(td);
		list.setPossDate(td.plusMonths(3));
		
		int count = mapper.update(list);
		log.info("UPDATE COUNT : " + count);
	}
	*/
	
	// Paging test
	/*
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(2);
		cri.setAmount(3);
		
		List<ListVO> list = mapper.getListWithPaging(cri);
		list.forEach(li -> log.info(li.getId() + " / " + li.getMediName()));
	}
	*/
	
	// Search test
	/*
	@Test
	public void testSearch() {
		Criteria cri = new Criteria(1, 5);
		cri.setKeyword("test");
		cri.setType("T");
		
		List<ListVO> list = mapper.getListWithPaging("test7", cri);
		
		list.forEach(li -> log.info(li));
	}
	*/
	
	@Test
	public void testGetList() {
		mapper.getMediList().forEach(list -> log.info(list));
	}

}
