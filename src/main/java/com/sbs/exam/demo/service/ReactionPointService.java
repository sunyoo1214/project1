package com.sbs.exam.demo.service;

import org.springframework.stereotype.Service;

import com.sbs.exam.demo.repository.ReactionPoinrRepository;

@Service
public class ReactionPointService {
	private ReactionPointRepository reactionPointRepository;
	
	public ReactionPointService(ReactionPointRepository reactionPointRepository) {
		this.reactionPointRepository = reactionPointRepository;
	}
	
	public boolean actorCanMakeReactionPoint(int actorId, String relTypeCode, int relId) {
		if( actorId == 0 ) {
			return false;
		}
		
		return ReactionPoinrRepository.getSumReactionPointByMemberId(relTypeCode, relId, actorId) == 0;
	}
	


}
