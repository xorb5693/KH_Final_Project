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
	
	public void sendMail(Member m, HttpServletRequest request, long timeout) {
		MimeMessage mail = mailSender.createMimeMessage();
		String msg = "<h2>안녕하세요 핼트너쉽 입니다!</h2><br><br>"
				+"<h3>"+m.getMemberName()+"님</h3>"+"<p>인증하기 버튼을 누르시면 인증이 됩니다</p>:"
				+ "<a href='http://localhost/healthner/member/verifyMail.do?memberId="+m.getMemberId()+"&timeout="+timeout+"&email="+m.getEmail()+"'>인증하기</a>";
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

	public void resetPw(Member member, long timeout, HttpServletRequest request ) {
		MimeMessage mail = mailSender.createMimeMessage();
		String msg = "<h2>안녕하세요 헬트너쉽입니다</h2><br><br>"
				+"<h3>"+member.getMemberName()+"님</h3><p>비밀번호를 제설정 해주세요</p>:"
				+"<a href='http://localhost/healthner/member/resetPwFrm.do?memberId="+member.getMemberId()+"&timeout="+timeout+"&email="+member.getEmail()+"'>재설정 하기</a>";
		try {
			mail.setSubject("[비밀번호 재설정]"+member.getMemberName()+"님 헬트너쉽 비밀번호를 재설정 해주세요");
			mail.setText(msg,"utf-8","html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(member.getEmail()));
			mailSender.send(mail);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void sendConfirmMail(String email, Member member, HttpServletRequest request, long timeout, StringBuilder sb) {
		MimeMessage mail = mailSender.createMimeMessage();
		String msg = "<h2>안녕하세요 헬트너쉽입니다</h2><br><br>"
				+"<h3>"+member.getMemberName()+"님</h3><p>인증번호 입니다</p>:"
				+"<h4>인증번호 : "+sb.toString()+" 입니다 </h4>";
		try {
			mail.setSubject("[비밀번호 재설정]"+member.getMemberName()+"님 헬트너쉽 비밀번호를 재설정 해주세요");
			mail.setText(msg,"utf-8","html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
