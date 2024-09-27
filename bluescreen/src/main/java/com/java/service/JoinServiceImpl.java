package com.java.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.java.dto.Member;
import com.java.mapper.JoinMapper;
import com.java.mapper.MyMapper;

@Service
public class JoinServiceImpl implements JoinService {
	@Autowired JoinMapper jmapper;
	@Autowired MyMapper mymapper;
	@Override
	public String idCheck(String id) {
		String idOk = jmapper.idCheck(id);
		return idOk;
	}
	@Override
	public String nicknameCheck(String nickname) {
		String nName = jmapper.nicknameCheck(nickname);
		return nName;
	}
	@Override
	public void insertMember(Member join) {
		//System.out.println(join.getId());
		jmapper.insertMember(join);
		
	}
	@Override
	public int selectUno(Member join) {
		int uno = jmapper.selectUno(join);
		
		return uno;
	}
	@Autowired JavaMailSender mailSender;
	@Override
	public String getCode(String name, String email) {
		System.out.println("이름 : "+name);
		System.out.println("메일주소 : "+email);
		//임시 비밀번호 생성
		String pwcode = createPwCode(); 
		System.out.println("생성된 임시코드 : "+pwcode);
		//이메일 발송
		sendEmail(name, email, pwcode);
		return pwcode;
	}
	
	private void sendEmail(String name, String email, String pwcode) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email); //-에게
		message.setFrom("su02552@gmail.com"); //-로부터   인증코드 받은 이메일
		message.setSubject(name+"님에게 이메일 인증 임시번호를 발송합니다.");//제목
		message.setText("안녕하세요. 회원가입 이메일 인증을 위한 임시번호를 안내해드립니다.\n"+
						"["+name+"님의 임시 번호는 '"+pwcode+"' 입니다.]\n");
		mailSender.send(message);
		System.out.println("메일이 발송되었습니다.");
	}

	//임시 비밀번호 생성 메소드
	private String createPwCode() {
		char[] charset = {'0','1','2','3','4','5','6','7','8','9',
				'a','b','c','d','e','f','g','h','i','j','k','l','m','n',
				'o','p','q','r','s','t','u','v','w','x','y','z'};
		String pwcode="";
		int idx=0;
		for(int i=0;i<10;i++) {
			idx=(int)(Math.random()*36);
			pwcode += charset[idx];
		}
		return pwcode;
	}
	@Override
	public Member selectAll(String id) {
		Member member = mymapper.selectUser(id);
		return member;
	}
	@Override
	public void updateUser(Member member) {
		jmapper.updateUser(member);
		
	}
	

}
