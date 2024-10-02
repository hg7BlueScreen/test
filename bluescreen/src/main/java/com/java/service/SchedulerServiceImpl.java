package com.java.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.java.dto.Drug;
import com.java.dto.Member;
import com.java.mapper.JoinMapper;

@Service
public class SchedulerServiceImpl implements SchedulerService {
	@Autowired JavaMailSender mailSender;
	@Autowired JoinMapper jmapper;
	@Scheduled(cron = "0 0 8 * * *", zone = "Asia/Seoul")	// 서울 시간으로 매일 8시 실행
	public void perDay() throws Exception {
		//소비기한 만료일지난 drug 가져오기(drug_user - uno,dno,ddate /
		Timestamp todate = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");

        String today = sdf.format(todate);

		ArrayList<Drug> dlist = jmapper.selectDrugAll(today);  
		ArrayList<Member> mlist = jmapper.selectMemberAll(today);  
		//System.out.println(dlist.get(0));System.out.println(mlist.get(0));
		//System.out.println("333"+mlist.size());
		
		medicineSendEmail(dlist, mlist);
		System.out.println("매일 8시 메일 보내기");
		
	}
//	@Scheduled(fixedDelay = 5000) //확인용
//	public void per5sec() throws Exception {
//		System.out.println("5");
//		perDay();
//	}
	
	private void medicineSendEmail(ArrayList<Drug> dlist, ArrayList<Member> mlist) {
		SimpleMailMessage message = new SimpleMailMessage();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일");
		
		if(!mlist.isEmpty()) {
			for(int i=0;i<mlist.size();i++) {
				String formattedDate = formatter.format(dlist.get(i).getDdate());
				message.setTo(mlist.get(i).getEmail());
				message.setSubject(mlist.get(i).getName()+"님의 복용중인 약 소비기한이 임박하여 알림을 드립니다.");
				if(dlist.get(i).getImageURL()!=null) {
					message.setText(dlist.get(i).getItem_name()+"\n권장 만료기간 : "+dlist.get(i).getDdate()+"\n"+formattedDate+"\n");
				}else {
					message.setText("약품명 : "+dlist.get(i).getItem_name()+"\n권장 만료기간 : "+formattedDate+"\n보관방법 : "+dlist.get(i).getStorage_method()+"\n**보관방법에 따라 권장 소비기한이 단축될 수 있습니다.**\n기한이 만료된 약은 저희 웹사이트를 통해 바르게 버려주시길 부탁드립니다.");
				}
				message.setFrom("su02552@gmail.com");
				mailSender.send(message);
			}
		}
	}
	
}
