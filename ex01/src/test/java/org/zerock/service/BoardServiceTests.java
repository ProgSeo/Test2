package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapperTests;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") // root-context.xml 참조
@Log4j
public class BoardServiceTests {

	@Autowired
	private BoardService service;

	@Test
	/*public void testRegister() {
		log.info(service);
		assertNotNull(service);
	}*/
	
public void testRegister() {
		//service.getList().forEach(board -> log.info(board));
		service.getList(new Criteria(2,10)).forEach(board -> log.info(board)); 
	}
//	public void testDelete() {
//		log.info("REMOVE RESULT: " + service.remove(2));
//	}
	
//	public void testUpdate() {
//		BoardVO board = service.get(1);
//		
//		if(board == null) {
//			return;
//		}
//		board.setTitle("제목을 수정합니다");
//		log.info("MODIFY RESULT: "+ service.modify(board));
//	}
}
