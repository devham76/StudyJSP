package frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.*;

// 클라이언트의 요청을 받는 역할을 하는 Controller

// 확장자가  .do이면 BFrontController 클래스로 온다
@WebServlet("*.do")
public class BFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		actionDo(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		System.out.println("actionDo start");
		
		request.setCharacterEncoding("UTF-8");
		
		String viewPage = null;		// view화면
		BCommand command = null;		// 로직수행
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		// 글쓰기 화면
		if(com.equals("/board/write_view.do")) {
			viewPage = "write_view.jsp";
		}
		// 글쓰기
		else if(com.equals("/board/write.do")) {
			command = new BWriteCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
		}
		// 글목록
		else if(com.equals("/board/list.do")) {
			command = new BListCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
		}
		// 글내용
		else if(com.equals("/board/content_view.do")) {
			command = new BContentCommand();
			command.execute(request, response);
			viewPage = "content_view.jsp";
		}
		// 글 수정
		else if(com.equals("/board/modify.do")){
			command = new BModifyCommand();
			command.execute(request, response);
			System.out.println("result : "+ request.getAttribute("result"));
			viewPage = "list.jsp";
		}
		
		// forwarding기법 (화면전환)
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
