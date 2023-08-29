package com.bobzip.on.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bobzip.on.member.model.service.MemberService;
import com.bobzip.on.member.model.vo.Member;

@Controller("memberController")
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberservice;
	
	
	@RequestMapping("/login")
	public String login(@RequestParam("loginId") String inputId,
						@RequestParam("loginPwd") String inputPwd,
						HttpSession session) {
		
		Member member = memberservice.login(inputId,inputPwd);
		if (member != null) {
			session.setAttribute("memberLoggedIn", member);
		} else {
			session.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
		return "redirect:/";
	}
}
