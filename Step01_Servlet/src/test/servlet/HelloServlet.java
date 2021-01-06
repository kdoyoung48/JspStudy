package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * hello 요청에 대해 응답을 할 서블릿 정의하기
 * 
 * 1.HttpServlet 클래스를 상속 받는다.
 * 2.service() 메소드 오버라이드
 * 3. 어떤 요청을 처리할지 어노테이션(@WebServlet) 을 클래스위에 작성한다.
 * 
 * 
 */
@WebServlet("/hello")
public class HelloServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter pw=resp.getWriter();
		pw.print("happy christmas");
		pw.flush();
		pw.close();
	}
}
