package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 게시판기능 로직에 실행할 명령들의 인터페이스
// execute를 구현하게만든다
public interface BCommand {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
