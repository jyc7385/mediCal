package jyc.medical.service;

import static org.junit.Assert.assertNotNull;

import java.time.LocalDate;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jyc.medical.domain.Criteria;
import jyc.medical.domain.ListVO;
import jyc.medical.service.ListService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class ListServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private ListService service;
	
	/*
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);	
	}
	*/
	
	/*
	@Test
	public void testRegister() {
		ListVO list = new ListVO();
		list.setId("jyc7385");
		list.setMediName("test222");
		list.setTakeDate(LocalDate.of(2017, 1, 1));
		list.setPossDate(LocalDate.of(2017, 4, 1));
		
		service.register(list);
		
		log.info("CREATE LIST : " + list.getId() + ", " + list.getMediName());
	}
	*/
	
	/*
	@Test
	public void testGetList() {
		service.getList().forEach(list -> log.info(list));
	}
	*/
	
	/*
	@Test
	public void testGet() { 
		log.info(service.get("jyc7385", "test111"));
	}
	*/
	
	/*
	@Test
	public void testDelete() {
		// Before run this code, check bno number have a table
		log.info("REMOVE RESULT : " + service.remove("jyc7385", "test222"));
	}
	*/
	
	/*
	@Test
	public void testUpdate() {
		ListVO list = service.get("jyc7385", "test111");
		
		if(list == null) return;
		
		list.setPossDate(LocalDate.of(2019, 7, 1));
		// service.get(4L); // Show result table in log
		log.info("MODIFY RESULT : " + service.modify(list));
	}
	*/
	
	// With paging
	/*
	@Test
	public void testGetList() {
		service.getList(new Criteria(2, 3)).forEach(list -> log.info(list));
	}
	*/
	
	@Test
	public void testGetList() {
		service.getMediList().forEach(list -> log.info(list));
	}
	
}
