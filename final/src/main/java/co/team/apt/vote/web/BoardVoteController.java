package co.team.apt.vote.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import co.team.apt.vote.service.BoardVoteService;

@Controller
public class BoardVoteController {
	
	@Autowired
	private BoardVoteService boardVoteService;
	
	

}
