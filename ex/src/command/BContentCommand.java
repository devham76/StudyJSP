package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BDao;
import dto.BDto;

public class BContentCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bId = request.getParameter("bId");
		BDao bdao = new BDao();
		BDto dto = bdao.contentView(bId);
		
		// content_view ��� �̸��� ���ؿ� dto�� �־��ش�
		request.setAttribute("content_view", dto);
	}

}
