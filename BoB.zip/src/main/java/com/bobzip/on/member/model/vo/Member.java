package com.bobzip.on.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	private String memberId;
	private String memberPwd;
	private String memberNick;
	private String phone;
	private String email;
	private String memberRoll;
	private Date regDate;
	private String address;
	
	
	public boolean checkPassword(String inputPwd) {
		if (memberPwd.equals(inputPwd)) {
			return true;
		}
		return false;
	}
}
