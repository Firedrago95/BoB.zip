package com.bobzip.on.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bobzip.on.member.model.dao.MemberDAO;
import com.bobzip.on.member.model.vo.Member;

@Service("memberService")
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	
}
