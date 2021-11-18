package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper mapper;

	@Override
	public int register(ReplyVO vo) {
		log.info("reply register.....");
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(int rno) {
		log.info("reply get.......");
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("reply modify.......");
		return mapper.update(vo);
	}

	@Override
	public int remove(int rno) {
		log.info("reply remove.....");
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, int bno) {
		log.info("reply getList........");
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, int bno) {
		// TODO Auto-generated method stub
		return new ReplyPageDTO(mapper.getCount(bno), mapper.getListWithPaging(cri, bno));
	}

	
}
