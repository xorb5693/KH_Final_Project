package kr.co.healthner.member.model.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.co.healthner.member.model.vo.Member;

@Service("memberMail")
public class MemberMailServiceImpl {

	@Autowired
	private JavaMailSender mailSender;
	
	public void sendMail(Member m, HttpServletRequest request) {
		MimeMessage mail = mailSender.createMimeMessage();
		String msg = "<h2>안녕하세요 핼트너쉽 입니다!</h2><br><br>"
				+"<h3>"+m.getMemberName()+"님</h3>"+"<p>인증하기 버튼을 누르시면 인증이 됩니다</p>:"
				+ "<a href='http://localhost:80"+request.getContextPath()+"/healthner/member/verifyMail.do?memberId="+m.getMemberId()+"'>인증하기</a>";
		try {
			mail.setSubject("[본인인증]"+m.getMemberName()+"님 헬트너쉽 본인인증 메일입니다");
			mail.setText(msg, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(m.getEmail()));
			mailSender.send(mail);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
