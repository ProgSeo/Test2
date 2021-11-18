package org.zerock.controller;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/Servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"}) // root-context.xml 참조
@Log4j
public class BoardCtrollerTests {

	@Autowired
	private WebApplicationContext ctx;
	
	@Autowired
	private BoardMapper mapper;
	
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
//	public void testList() throws Exception{
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	
//	@Test
//	public void testListPaging() throws Exception{
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")
//				.param("pageNum", "2")
//				.param("amount", "10"))
//				.andReturn().getModelAndView().getModelMap());
//	}
//	@Test
//	public void testGet() throws Exception{
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get").param("bno", "1"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap()
//				);
//	}
//	
//	@Test
//	public void testModify() throws Exception{
//		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
//				.param("bno", "99")
//				.param("title", "수정된 테스트 새글 제목")
//				.param("content", "수정된 테스트 새글 내용")
//				.param("writer", "user00"))
//				.andReturn().getModelAndView().getViewName()
//				);
//	}
	
//	@Test
//	public void testRemove() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
//				.param("bno", "4")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
	
	@Test
	public void testSeach() {
		Criteria cri = new Criteria();
		cri.setKeyword("한글");
		cri.setType("TC");
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
	}
}
