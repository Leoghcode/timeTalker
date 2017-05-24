package test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class task
 */
@WebServlet("/task")
public class task extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public task() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("123abs"+request.getParameter("taskname"));
		/*response.getWriter().append("[{\"taskid\":\"t1\",\"taskname\":\"task1\",\"finished\":\"true\",[{\"date\":1,\"starttime\":\"11111111\",\""
				+ "endtime\":\"111111222\"},{\"date\":2,\"starttime\":\"11111111\",\"endtime\":\"11122333\"}],\"description\":\"dasdasd12dsa\"},"
				+"{\"taskid\":\"t2\",\"taskname\":\"task2\",\"finished\":\"false\",[{\"date\":2,\"starttime\":\"11111111\",\""
				+ "endtime\":\"111111222\"},{\"date\":3,\"starttime\":\"11111111\",\"endtime\":\"11122333\"}],\"description\":\"dasdasd12dsa\"}]");*/
		response.getWriter().append("[{\"taskid\":\"t1\",\"taskname\":\"task1\",\"typeid\":1,\"finished\":\"true\",\"starttime\":1482948924,\"finishtime\":1482948925,\"time\":[{\"date\":1,\"starttime\":\"18:00\",\""
				+ "endtime\":\"19:35\"},{\"date\":2,\"starttime\":\"19:45\",\"endtime\":\"20:10\"}],\"description\":\"dasdasd12dsa\"},"
				+"{\"taskid\":\"t2\",\"taskname\":\"task2\",\"typeid\":2,\"finished\":\"false\",\"starttime\":1482948924,\"finishtime\":1482948925,\"time\":[{\"date\":2,\"starttime\":\"15:30\",\""
				+ "endtime\":\"16:30\"},{\"date\":3,\"starttime\":\"17:30\",\"endtime\":\"18:30\"}],\"description\":\"dasdasd12dsa\"}]");
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
