package common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import moo.ng.san.member.model.vo.Member;


@Component
@Aspect
public class PasswordEncAdvice {

	@Autowired
	private SHA256Enc passEnc;
	
	@Pointcut(value = "execution(* moo.ng.san.member.model.service.MemberService.*Member(moo.ng.san.member.model.vo.Member,..))")
	public void encPointCut() {}
	
	@Before(value = "encPointCut()")
	public void passwordEnc(JoinPoint jp) throws Exception{
		Object[] args = jp.getArgs();
		Member member = (Member)args[0];
		String memberPw = member.getMemberPw();
			if(memberPw!=null) {
				String encPw = passEnc.encData(memberPw);
				member.setMemberPw(encPw);
			}
	}

}//PasswordEncAdvice
