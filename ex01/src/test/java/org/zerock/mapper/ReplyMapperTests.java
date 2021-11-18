package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") // root-context.xml 참조
@Log4j
public class ReplyMapperTests {

	private int[] bnoArr = { 163846, 163845, 163844, 163843, 163832 };
	@Autowired
	ReplyMapper mapper;
	
	@Test //연결확인
	public void testMapper() {
		log.info(mapper);
	}
	
//	@Test
//	public void testInsert() {
//		IntStream.range(1, 10).forEach(i ->{
//			ReplyVO vo = new ReplyVO();
//			
//			vo.setBno(bnoArr[i % 5]);
//			vo.setReply("댓글테스트" + i);
//			vo.setReplayer("replyer" + i);
//			
//			mapper.insert(vo);
//		});
//	}
	
//	@Test
//	public void testRead() {
//		ReplyVO vo = mapper.read(5);
//		
//		log.info(vo);
//	}
	
//	@Test
//	public void testDelete() {
//		int result = mapper.delete(4);
//		
//		log.info("result: " + result);
//	}
//	
//	@Test
//	public void testUpdate() {
//		ReplyVO vo = mapper.read(5);
//		vo.setReply("Update Reply");
//		int result = mapper.update(vo);
//		
//		log.info("result: " + result);
//	}
//	
	@Test
	public void testList() {
		Criteria cri =  new Criteria(1,10);
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 163845);
		
		replies.forEach(reply -> log.info(reply));
	}
}
