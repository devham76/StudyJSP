package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// �Խ��Ǳ�� ������ ������ ��ɵ��� �������̽�
// execute�� �����ϰԸ����
public interface BCommand {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
