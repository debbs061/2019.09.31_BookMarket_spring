package com.book;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.ItemDTO;
import com.join.CustomInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBConn2;
import com.util.FileManager;
import com.util.MyUtil;

public class BookServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
		
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
		
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		
		Connection conn = DBConn2.getConnection();
		
		MemberDAO mdao = new MemberDAO(conn);
		ProductDAO pdao = new ProductDAO(conn);
		OrdersDAO odao = new OrdersDAO(conn);
		ItemDAO idao = new ItemDAO(conn);
		OrderCartDAO ocdao = new OrderCartDAO(conn);
		BoardDAO bdao = new BoardDAO(conn);
		ReviewDAO redao = new ReviewDAO(conn);
		
		MyUtil myUtil = new MyUtil();
		
		String url;
		
		String root = getServletContext().getRealPath("/");
		String path = root + File.separator + "pds" + File.separator + "productImage";
		
		File f = new File(path);
		
		if(!f.exists()) {
			f.mkdirs();
		}
		//index.do
		if(uri.indexOf("index.do")!=-1) {
			
			//cart������
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id;
			
			if(info!=null) {
				id =info.getUserId();
			}else {
				id="";
			}
			
			List<ItemDTO> ilists = idao.getLists(id);
			req.setAttribute("ilists", ilists);
		
			
			String pageNum = req.getParameter("pageNum");
			
			int currentPage = 1;
			
			if(pageNum!=null){
				currentPage = Integer.parseInt(pageNum);
			}

			int dataCount = pdao.getDataCount();

			int numPerPage = 8;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if(currentPage>totalPage){
				currentPage = totalPage;
			}

			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<ProductDTO> lists = pdao.getLists(start,end);

			List<ProductDTO> litlists = pdao.getLists("����",start,end);
			List<ProductDTO> esslists = pdao.getLists("������",start,end);
			List<ProductDTO> hislists = pdao.getLists("����",start,end);
			List<ProductDTO> scilists = pdao.getLists("����",start,end);
			List<ProductDTO> comlists = pdao.getLists("��ǻ��",start,end);
			
			String listUrl = cp + "/itwill/index.do";
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			String imagePath = cp + "/pds/productImage";
			
			//String deletePath = cp + "/file/delete.do";
			
			req.setAttribute("lists", lists);

			req.setAttribute("litlists", litlists);
			req.setAttribute("esslists", esslists);
			req.setAttribute("hislists", hislists);
			req.setAttribute("scilists", scilists);
			req.setAttribute("comlists", comlists);

			//req.setAttribute("deletePath", deletePath);
			
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			
			req.setAttribute("imagePath", imagePath);
			
			url = "/book/index.jsp";
			forward(req, resp, url);
		}
	
		
		else if(uri.indexOf("created.do")!=-1){
			
			url = "/book/created.jsp";
			forward(req,resp,url);
		}
		
		
		else if(uri.indexOf("created_ok.do")!=-1){
			
			//1.���� ���ε�
			String encType = "UTF-8";
			int maxSize = 10*1024*1024;
			
			MultipartRequest mr =
					new MultipartRequest(req, path, maxSize, encType, new DefaultFileRenamePolicy());
			
			//2.DB����
			if(mr.getFile("upload")!=null) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setName(mr.getParameter("name"));
				dto.setNum(pdao.getMaxNum()+1);
				dto.setPrice(mr.getParameter("price"));
				dto.setReview(mr.getParameter("review"));
				dto.setSaveFileName(mr.getFilesystemName("upload"));
				dto.setCategory(mr.getParameter("category"));
				dto.setWriter(mr.getParameter("writer"));
				
				pdao.insertData(dto);
			}
			url = cp + "/itwillbook/index.do";
			resp.sendRedirect(url);
		}
		//product-detail.do
		else if(uri.indexOf("product-detail.do")!=-1){

			//cart������
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id;

			if(info!=null) {
				id =info.getUserId();
			}else {
				id="";
			}

			List<ItemDTO> ilists = idao.getLists(id);
			req.setAttribute("ilists", ilists);


			int num = Integer.parseInt(req.getParameter("num"));

			String imagePath = cp + "/pds/productImage";

			ProductDTO dto = pdao.getReadData(num);

			req.setAttribute("dto", dto);
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("num", num);

			//������� �߰� �ڵ�

			MemberDTO mdto=mdao.getReadData(id);

			//��������¡ ó�� �۾�
			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;

			if(pageNum!=null){
				currentPage = Integer.parseInt(pageNum);
			}

			int dataCount = redao.reviewCountByProductNum(num); //�ش�Product num�� ���� ���䰹��

			int numPerPage = 5;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if(currentPage>totalPage){
				currentPage = totalPage;
			}

			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;

			//���䰹�� ���ϱ�
			List<ReviewDTO> reviewLists = redao.getLists(num,start,end);

			String listUrl = cp + "/itwillbook/product-detail.do?num="+num;
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("pageNum", currentPage);
			//req.setAttribute("currentPage", currentPage);

			int reviewDataCount = redao.reviewCountByProductNum(num);

			req.setAttribute("mdto", mdto); //ȸ������ 
			req.setAttribute("reviewLists", reviewLists); //��������
			req.setAttribute("reviewDataCount", reviewDataCount); //���䰹��

			url = "/book/product-detail.jsp";
			forward(req,resp,url);

		}
		//cart.do
		else if(uri.indexOf("cart.do")!=-1) {
			
			String imagePath = cp + "/pds/productImage";
			
			//cart������
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id;
			
			if(info!=null) {
				id =info.getUserId();
			}else {
				id="";
			}
			
			List<ItemDTO> ilists = idao.getLists(id);
			req.setAttribute("ilists", ilists);
			//

			List<ItemDTO> lists = 
					idao.getLists(info.getUserId());
			
			req.setAttribute("lists", lists);
			req.setAttribute("imagePath", imagePath);
			
			url = "/book/cart.jsp";
			forward(req, resp, url);
		}
		//cart_ok.do
		else if(uri.indexOf("cart_ok.do")!=-1) {

			ItemDTO idto = null;
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String num = req.getParameter("num");
			
			
			if(info==null){
				session.setAttribute("prevPage", cp + "/itwillbook/product-detail.do?num="+num); 
				url = "/book/login.jsp";
				forward(req,resp,url);
				return;
			}

			String id =info.getUserId();
			String name = req.getParameter("name");
			
			//Cart �ߺ� �˻�
			int i=0;
			i=idao.checkOverlap(id, name);
			
			idto= new ItemDTO();
			
			idto.setId(id);
			idto.setName(req.getParameter("name"));
			idto.setQuantity(req.getParameter("quantity"));
			idto.setPrice(req.getParameter("price"));
			idto.setSaveFileName(req.getParameter("saveFileName"));
			idto.setNum(num);
			
			try { //Cart�� �ߺ��Ǵ� å�� ���� ��� >> Insert��
				
				 if(i==0) { 
					 
					idao.insertItem(idto);
					
					url=cp+"/itwillbook/cart.do";
					resp.sendRedirect(url);
					return;
					
				}else{ // Cart�� �̹� �ߺ��Ǵ� å�� ���� ��� >>update ��
					
					idao.updateItemWhenOverlap(idto);
					
					url=cp+"/itwillbook/cart.do";
					resp.sendRedirect(url);
					return;			
				}
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		//cart_updated.do
		else if(uri.indexOf("cart_updated.do")!=-1) {
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			
			String id = info.getUserId();
			
			String name = req.getParameter("name");
			String quantity = req.getParameter("quantity");
			
			idao.updateItemByName(id, name, quantity);
			
			url = cp + "/itwillbook/cart.do";
			resp.sendRedirect(url);
		}
		//deleteItemIndex.do
		else if(uri.indexOf("deleteItemIndex.do")!=-1) {

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id = info.getUserId();

			String name = req.getParameter("name");

			idao.deleteItemByName(name, id);

			url = cp+ "/itwillbook/index.do";
			resp.sendRedirect(url);
		}
		//deleteItemProductDetail.do
		else if(uri.indexOf("deleteItemProductDetail.do")!=-1) {

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id = info.getUserId();

			String name = req.getParameter("name");

			idao.deleteItemByName(name, id);

			url = cp+ "/itwillbook/product-detail.do";
			resp.sendRedirect(url);
		}
		//deleteItemCheckout.do
		else if(uri.indexOf("deleteItemCheckout.do")!=-1) {

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id = info.getUserId();

			String name = req.getParameter("name");

			idao.deleteItemByName(name, id);

			url = cp+ "/itwillbook/checkout.do";
			resp.sendRedirect(url);
		}
		//deleteItemBookList.do
		else if(uri.indexOf("deleteItemBookList.do")!=-1) {

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id = info.getUserId();

			String name = req.getParameter("name");

			idao.deleteItemByName(name, id);

			url = cp+ "/itwillbook/book-list.do";
			resp.sendRedirect(url);
		}
		//deleteItemOrders.do
		else if(uri.indexOf("deleteItemOrders.do")!=-1) {

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id = info.getUserId();

			String name = req.getParameter("name");

			idao.deleteItemByName(name, id);

			url = cp+ "/itwillbook/orders.do";
			resp.sendRedirect(url);
		}
		//deleteItemMail.do
		else if(uri.indexOf("deleteItemMail.do")!=-1) {

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id = info.getUserId();

			String name = req.getParameter("name");

			idao.deleteItemByName(name, id);

			url = cp+ "/itwillbook/mail.do";
			resp.sendRedirect(url);
		}
		//deleteItemLocation.do
		else if(uri.indexOf("deleteItemLocation.do")!=-1) {

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id = info.getUserId();

			String name = req.getParameter("name");

			idao.deleteItemByName(name, id);

			url = cp+ "/itwillbook/location.do";
			resp.sendRedirect(url);
		}
		//deleteItemByName.do
		else if(uri.indexOf("deleteItemByName.do")!=-1) {

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id= info.getUserId();

			String name = req.getParameter("name");

			idao.deleteItemByName(name, id);

			url = cp+ "/itwillbook/cart.do";
			resp.sendRedirect(url);
		}
		//deleteAllItems.do
		else if(uri.indexOf("deleteAllItems.do")!=-1) {
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id= info.getUserId();
			
			idao.deleteAllItems(id);
			
			url = cp+ "/itwillbook/cart.do";
			resp.sendRedirect(url);
		}
		//checkout.do
		else if(uri.indexOf("checkout.do")!=-1){
			
			//HttpSession session = req.getSession();
			//CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			
			//cart������
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id;
			
			if(info!=null) {
				id =info.getUserId();
			}else {
				id="";
			}
			List<ItemDTO> ilists = idao.getLists(id);
			req.setAttribute("ilists", ilists);
			//
			
			if(info==null){

				url = "/book/login.jsp";
				forward(req,resp,url);
				return;
			}

			//String id =info.getUserId();
			
			MemberDTO mdto = mdao.getReadData(id);
			
			List<ItemDTO> lists = idao.getLists(id);
			
			String imagePath = cp + "/pds/productImage";
			req.setAttribute("imagePath", imagePath);
			
			req.setAttribute("lists", lists);
			req.setAttribute("mdto", mdto);
			
			url = "/book/checkout.jsp";
			forward(req,resp,url);
		}
		//checkout_ok.do
		else if(uri.indexOf("checkout_ok.do")!=-1){
			
			String id = req.getParameter("id");
			int rNum = (int) (Math.random()*9999+1);
			String num = rNum+"";
			OrdersDTO dto = new OrdersDTO();
			
			dto.setUserName(req.getParameter("userName"));
			dto.setEmail(req.getParameter("email"));
			dto.setTel(req.getParameter("tel"));
			dto.setAddr(req.getParameter("addr"));
			dto.setNotes(req.getParameter("notes"));
			dto.setId(id);
			dto.setNum(num);
			
			odao.insertData(dto,num);
			
			List<ItemDTO> lists = idao.getLists(id);
			
			Iterator<ItemDTO> it = lists.iterator();
			
			while(it.hasNext()) {
				ItemDTO idto = it.next();
				
				ocdao.insertItem(idto,num);
			}
			
			idao.deleteAllItems(id);
			
			url = cp + "/itwillbook/checkoutok.do?num=" + num;
			resp.sendRedirect(url);
		}
		//checkoutok.do
		else if(uri.indexOf("checkoutok.do")!=-1){
			
			String num = req.getParameter("num");
			
			req.setAttribute("num", num);
			
			url = "/book/checkoutok.jsp";
			forward(req,resp,url);
		}
		//orders.do(������ ����)
		else if(uri.indexOf("orders.do")!=-1) {

			//cart������
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id;
			
			if(info!=null) {
				id =info.getUserId();
			}else {
				id="";
			}
			List<ItemDTO> ilists = idao.getLists(id);
			req.setAttribute("ilists", ilists);
			//

			if(info==null){
				
				session.setAttribute("prevPage", uri); // ���������� �ø��� -2

				url = "/book/login.jsp";
				forward(req,resp,url);
				return;
			}

			String imagePath = cp + "/pds/productImage";
			//String id = info.getUserId();

			List<OrdersDTO> lists = odao.getList(id);

			req.setAttribute("lists", lists);
			req.setAttribute("imagePath", imagePath);

			url = "/book/orders.jsp";
			forward(req, resp, url);
		}
		//orderDelte.do
		else if(uri.indexOf("orderDelete")!=-1) {

			String num = req.getParameter("num");

			ocdao.deleteData(num);
			odao.deleteData(num);

			url = cp + "/itwillbook/orders.do";
			resp.sendRedirect(url);
		}
		//register.do
		else if(uri.indexOf("register.do")!=-1) {
			
			url = "/book/register.jsp";
			forward(req, resp, url);
		}
		//register_ok.do
		else if(uri.indexOf("register_ok.do")!=-1) {
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUserId(req.getParameter("userId"));
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserName(req.getParameter("userName"));
			dto.setUserBirth(req.getParameter("userBirth"));
			dto.setUserTel(req.getParameter("userTel"));
			dto.setEmail(req.getParameter("email"));
			
			mdao.insertData(dto);
			
			url = cp + "/itwillbook/complete.do";
			resp.sendRedirect(url);
		}
		//complete.do
		else if(uri.indexOf("complete.do")!=-1) {
			
			url = "/book/register_ok.jsp";
			forward(req, resp, url);
		}
		//login.do
		else if (uri.indexOf("login.do")!=-1) {
			
			url = "/book/login.jsp";
			forward(req,resp,url);
		} 
		
		//login_ok.do
		else if (uri.indexOf("login_ok.do")!=-1) {
			
			// login.jsp���� id, pw �� �Ѿ��
			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
			
			MemberDTO dto = mdao.getReadData(userId); 
			
			if (dto==null || !dto.getUserPwd().equals(userPwd) ) {
				
				req.setAttribute("message", "���̵� Ȥ�� ��й�ȣ�� ��Ȯ�� �Է��ϼ���!"); 
				// msg ������ ��
				
				url = "/book/login.jsp";
				forward(req,resp,url);
				
				return; 
			}
	
			HttpSession session = req.getSession(); 
			
			// 2�� �̻��� �����ʹ� class�� �ø��� 
			CustomInfo info = new CustomInfo();
			info.setUserId(dto.getUserId());
			info.setUserName(dto.getUserName());
			
			// Ŭ������ ���ǿ��ٰ� �ø��� ���
			session.setAttribute("customInfo", info); 
			
			// �α��� �� �־��� �������� ���ư��� 
			url = (String)session.getAttribute("prevPage");
			
			if(url != null) { // url�� ���� �־��ٸ�,
				session.removeAttribute("prevPage");
			} else {	//ó�� �α��� ���������ٸ�
				url = cp + "/itwillbook/index.do";
			}
			// -------------------
			
			//������ ��������Ƿ� redirect!
			//url = cp + "/itwillbook/index.do"; // index.jsp (�ʱ�ȭ��) �� ���°Ŵϱ�
			resp.sendRedirect(url);
			
		} 
		
		//logout.do
		else if (uri.indexOf("logout.do")!=-1) {
			
			// logout�� session�� ���� ����� ��
			HttpSession session = req.getSession(); 
			//() �ȿ� true���� �ȵ�. �� ���� �����ϴ°� �ƴϴϱ�
			
			session.removeAttribute("customInfo");
			//customInfo��� ����(Ŭ����)��ü�� �����ض�
			
			//������ �� �ٲ� �� 
			url = cp + "/itwillbook/index.do";
			resp.sendRedirect(url);
		} 
		//searchpw.do
		else if (uri.indexOf("searchpw.do")!=-1) {
			
			url = "/book/searchpw.jsp";
			forward(req,resp,url);
		} 
		//searchpw_ok.do
		else if (uri.indexOf("searchpw_ok.do")!=-1) {
		
			// searchpw.jsp���� id, tel �� �Ѿ��
			String userId = req.getParameter("userId");
			String userTel = req.getParameter("userTel");

			MemberDTO dto = mdao.getReadData(userId); // id�� ���ٸ� null�� ������

			if (dto==null || !dto.getUserTel().equals(userTel)) {
				// class -> jsp �� �����͸� �ѱ���� setAttribute
				req.setAttribute("message", "ȸ�������� �������� �ʽ��ϴ�"); 
				// msg ������ ��

				url = "/book/login.jsp"; 
				forward(req,resp,url);

				return; 
			}
			
			// userId�� userTel �°� ������? =>  pwd ��Ƽ� ������
			String pwd = dto.getUserPwd();
			req.setAttribute("message", "��й�ȣ�� ["+ pwd +"] �Դϴ�"); 
			
			url = "/book/login.jsp"; 
			forward(req,resp,url);
		}
		//created.do
		else if(uri.indexOf("created.do")!=-1) {
			
			url = "/book/created.jsp";
			forward(req, resp, url);
		}
		//created_ok.do
		else if(uri.indexOf("created_ok.do")!=-1) {
			
			//1.���� ���ε�
			String encType = "UTF-8";
			int maxSize = 10*1024*1024;
			
			MultipartRequest mr =
					new MultipartRequest(req, path, maxSize, encType, new DefaultFileRenamePolicy());
			
			//2.DB����
			if(mr.getFile("upload")!=null) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setName(mr.getParameter("name"));
				dto.setNum(pdao.getMaxNum()+1);
				dto.setPrice(mr.getParameter("price"));
				dto.setReview(mr.getParameter("review"));
				dto.setSaveFileName(mr.getFilesystemName("upload"));
				dto.setCategory(mr.getParameter("category"));
				dto.setWriter(mr.getParameter("writer"));
				
				pdao.insertData(dto);
			}
			
			ProductDTO dto = new ProductDTO();
			
			dto.setName(req.getParameter("name"));
			dto.setNum(pdao.getMaxNum()+1);
			dto.setPrice(req.getParameter("price"));
			dto.setReview(req.getParameter("review"));
			dto.setSaveFileName(req.getParameter("saveFileName"));
			dto.setCategory(req.getParameter("category"));
			
			pdao.insertData(dto);
			
			url = cp + "/itwillbook/index.do";
			resp.sendRedirect(url);
			
		}
		//book-list.do
		else if(uri.indexOf("book-list.do")!=-1){
		
			//cart������
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id;
			
			if(info!=null) {
				id =info.getUserId();
			}else {
				id="";
			}
			List<ItemDTO> ilists = idao.getLists(id);
			req.setAttribute("ilists", ilists);
			//
			
			String pageNum = req.getParameter("pageNum");
			
			int currentPage = 1;
			
			if(pageNum!=null){
				currentPage = Integer.parseInt(pageNum);
			}
	
			int dataCount = pdao.getDataCount();
	
			int numPerPage = 5;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	
			if(currentPage>totalPage){
				currentPage = totalPage;
			}
	
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<ProductDTO> lists = pdao.getLists(start,end);
			
			String listUrl = cp + "/itwillbook/book-list.do";
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			String imagePath = cp + "/pds/productImage";
			
			//String deletePath = cp + "/file/delete.do";
			
			req.setAttribute("lists", lists);
			//req.setAttribute("deletePath", deletePath);
			
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			
			req.setAttribute("imagePath", imagePath);
			
			url = "/book/book-list.jsp";
			forward(req,resp,url);
		}
		//mail.do
		else if(uri.indexOf("mail.do")!=-1) {
			
			//cart������
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id;
			
			String imagePath = cp + "/pds/productImage";
			
			if(info!=null) {
				id =info.getUserId();
			}else {
				id="";
			}
			List<ItemDTO> ilists = idao.getLists(id);
			req.setAttribute("ilists", ilists);
			//
			
			req.setAttribute("imagePath", imagePath);
			
			url = "/book/mail.jsp";
			
			forward(req, resp, url);
			
		}
		//mail_ok.do
		else if(uri.indexOf("mail_ok.do")!=-1) {
			
			url = "/book/mail_ok.jsp";
			
			forward(req, resp, url);
		}
		//board.do
		else if(uri.indexOf("board.do")!=-1)  {
			
			//cart������
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id;
			
			if(info!=null) {
				id =info.getUserId();
			}else {
				id="";
			}
			
			List<ItemDTO> ilists = idao.getLists(id);
			req.setAttribute("ilists", ilists);
			//
			
			String imagePath = cp + "/pds/productImage";
			
			req.setAttribute("imagePath", imagePath);

			Calendar cal = Calendar.getInstance();

			int nowYear = cal.get(Calendar.YEAR);
			int nowMonth = cal.get(Calendar.MONTH) + 1;
			int nowDay = cal.get(Calendar.DAY_OF_MONTH);
			
			String strYear = req.getParameter("year");
			String strMonth = req.getParameter("month");
			String strDay = req.getParameter("day");

			int year = nowYear; //2019
			int month = nowMonth; //9
			int day = nowDay;
	
			if (strYear != null) { 
				year = Integer.parseInt(strYear);
				month = Integer.parseInt(strMonth);
			}
			
			if (strMonth != null) {
				month = Integer.parseInt(strMonth);
			}
			
			if (strDay != null) {
				day = Integer.parseInt(strDay);
			}

			int preYear = year, preMonth = month - 1;
			if (preMonth < 1) {
				preYear = year - 1;
				preMonth = 12;
			}

			int nextYear = year, nextMonth = month + 1;
			if (nextMonth > 12) {
				nextYear = year + 1;
				nextMonth = 1;
			}

			
			cal.set(year, month - 1, 1);
			
			// Ŭ���� ���� ù ��(1)�� ������ ��(31)
			int startDay = 1;
			int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

			
			int week = cal.get(Calendar.DAY_OF_WEEK); //1~7
			
			String dateStr = month + "-"; 
			
			
			List<BoardDTO> lists = bdao.getLists(dateStr); 
			// ���� ��¥�� X�� �� �ش��ϴ� �����͵� �ҷ���
			
			req.setAttribute("year",year);
			req.setAttribute("month",month);
			req.setAttribute("day",day);
			
			req.setAttribute("preMonth",preMonth);
			req.setAttribute("preYear",preYear);
			req.setAttribute("nextYear",nextYear);
			req.setAttribute("nextMonth", nextMonth);
			
			req.setAttribute("startDay", startDay);  
			req.setAttribute("endDay", endDay); 
			req.setAttribute("week", week); 
			
			req.setAttribute("lists", lists);
			
			url = "/book/calendar.jsp"; 
			forward(req,resp,url);
		}  
		//board_ok.do
		else if(uri.indexOf("board_ok.do")!=-1)  {	// ��� ���� insert �޼ҵ�
			
			int num = Integer.parseInt(req.getParameter("num"));
			int year = Integer.parseInt(req.getParameter("year"));
			int month = Integer.parseInt(req.getParameter("month"));
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
			String userId = info.getUserId(); 
			
			bdao.updateData(num); // �ο� ����
			bdao.insertData(num,userId);
			
			url = cp + "/itwillbook/board_check.do?num=" +num+"&year="+year+"&month="+month; 
			resp.sendRedirect(url);
		}
		//board_create.do
		else if(uri.indexOf("board_create.do")!=-1)  {
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
			
			//�α����� ���� ���¸� �α��� �������� forward
			if(info==null) {
				
				session.setAttribute("prevPage", uri); // ���� ������ �ø��� -3
				
				url = "/book/login.jsp";
				forward(req,resp,url);
				return;
			}
			
			url = "/book/board_create.jsp"; 
			forward(req,resp,url);
		} 
		//board_create_ok.do
		else if(uri.indexOf("board_create_ok.do")!=-1)  {
			
			Calendar cal = Calendar.getInstance();
			int nowYear = cal.get(Calendar.YEAR);
			
			BoardDTO dto = new BoardDTO();
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
			String advisorId = info.getUserId();
			
			
			String dateRes = req.getParameter("bookDate");
			String a[] = dateRes.split("-");
			
			if (a[1].charAt(0)=='0') {
				a[1] = a[1].substring(1);
			}
			
			if (a[2].charAt(0)=='0') {
				a[2] = a[2].substring(1);
			}
			
		    dateRes = a[1] + "-" + a[2];
			
			
			dto.setBookName(req.getParameter("bookName"));
			dto.setBookDate(dateRes);
			dto.setTime(req.getParameter("time"));
			dto.setPlace(req.getParameter("place"));
			dto.setTotalMember(Integer.parseInt(req.getParameter("totalMember")));
			
			
			int maxx =bdao.getMaxNum()+1;
			dto.setNum(maxx);
			dto.setAdvisorId(advisorId);
			
			bdao.createData(dto);
			

			url = cp + "/itwillbook/board.do?year="+nowYear+"&month="+a[1]; 
			resp.sendRedirect(url);
		}
		
		
		//board_check.do
		else if(uri.indexOf("board_check.do")!=-1)  {	
			
			//cart������
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id;
			

			if(info!=null) {
				id =info.getUserId();
			}else {
				id="";
			}

			List<ItemDTO> ilists = idao.getLists(id);
			req.setAttribute("ilists", ilists);

			String imagePath = cp + "/pds/productImage";

			req.setAttribute("imagePath", imagePath);
			
			
			int num = Integer.parseInt(req.getParameter("num"));
			int year = Integer.parseInt(req.getParameter("year"));
			int month = Integer.parseInt(req.getParameter("month"));
			
			if(info==null) { // �α��� �ȵǾ� ������ �α��� ��������,
				
				session.setAttribute("prevPage", cp + "/itwillbook/board_check.do?num="+num+"&year=2019&month="+month); 
				// ���� ������ �ø���
				url = "/book/login.jsp";
				forward(req,resp,url);
				return;
			}

			String userId = info.getUserId(); // ���� ������ id 

			List<BoardDTO> lists=bdao.checkUserId(num);
			Iterator<BoardDTO> it = lists.iterator(); 

			BoardDTO dto2 = bdao.getReadData(num); 
			String[] idList = new String[lists.size()];  

			int i = 0;

			while(it.hasNext()) { 

				BoardDTO dto= it.next(); 

				idList[i] = dto.getUserId(); // userId �� ����

				i ++;
			}

			req.setAttribute("dto2", dto2);
			req.setAttribute("idList", idList); 

			url = "/book/calendar_ok.jsp?year="+year+"&month="+month;
			forward(req,resp,url);
			return;
		}
		
		
		//delete.do
		else if(uri.indexOf("book_delete.do")!=-1) {
			
			//cart������
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id;
			
			if(info!=null) {
				id =info.getUserId();
			}else {
				id="";
			}
			
			List<ItemDTO> ilists = idao.getLists(id);
			req.setAttribute("ilists", ilists);
			//
			
			String imagePath = cp + "/pds/productImage";
			
			req.setAttribute("imagePath", imagePath);
			
			url = "/book/delete.jsp";
			forward(req, resp, url);
		}
		//delete_ok.do
		else if(uri.indexOf("delete_ok.do")!=-1) {
			
			//delete�� name�� �Ѿ��
			String name = req.getParameter("name");

			ProductDTO dto = pdao.getReadData(name);
			
			String imagePath = cp + "/pds/productImage";
			
			//System.out.println("1");
			//������� �ȉ�
			//1. ���ϻ���
			FileManager.doFileDelete(dto.getName(), imagePath);
			//System.out.println("3");
						
			//2. ������
			pdao.deleteData(name);
			//System.out.println("4");
			
			url = cp + "/itwillbook/index.do";
			resp.sendRedirect(url);
		}
		//id_check.do
		else if(uri.indexOf("id_check.do")!=-1)  {	
			
			String id = req.getParameter("id");
			int result = mdao.IdCheck(id);
	
			req.setAttribute("result", result);
			req.setAttribute("id", id);
			url = "/book/confirmid.jsp";
			forward(req,resp,url);
			return;
		}
		//location.do
		else if(uri.indexOf("location.do")!=-1) {
			
			//cart������
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id;
			
			String imagePath = cp + "/pds/productImage";
			
			if(info!=null) {
				id =info.getUserId();
			}else {
				id="";
			}
			List<ItemDTO> ilists = idao.getLists(id);
			req.setAttribute("ilists", ilists);
			//
			
			req.setAttribute("imagePath", imagePath);
			url = "/book/location.jsp";
			forward(req,resp,url);
			
		}
		//review.do
		else if(uri.indexOf("review.do")!=-1) {
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id=null;
			String userPwd=null;
			
			if(info!=null) {
				id =info.getUserId();
				userPwd=info.getUserPwd();
			}else {
				id=req.getParameter("userId");
				userPwd=req.getParameter("userPwd");
			}
			
			ReviewDTO redto = new ReviewDTO();
			
			redto.setUserName(req.getParameter("userName"));
			redto.setEmail(req.getParameter("email"));
			redto.setReviewDate(req.getParameter("reviewDate"));
			redto.setRating(Integer.parseInt(req.getParameter("rating")));
			redto.setReviewContent(req.getParameter("reviewContent"));
			redto.setNum(req.getParameter("num"));
			redto.setUserId(id);
			redto.setUserPwd(userPwd);
			
			//���� ���̺� ������Ʈ
			redao.insertDataOfReview(redto);
			
			//product-detail�� Num �Ѱ��ֱ�
			String num =req.getParameter("num");
			
			/*
			//����¡ ó��
			//Product-deatail.jsp ��������� reviewPageNum �Ѱ��ֱ�
			String pageNum= req.getParameter("pageNum");
			*/
			
			url=cp +"/itwillbook/product-detail.do?num="+num;
			resp.sendRedirect(url);
		}
		//review_delete.do
		else if(uri.indexOf("review_delete.do")!=-1) {

			String reviewDate = req.getParameter("reviewDate");
			String r_seq = req.getParameter("r_seq");

			String pageNum= req.getParameter("pageNum");

			redao.ReviewDeletion(r_seq);

			String num =req.getParameter("num");

			url=cp +"/itwillbook/product-detail.do?num="+num+"&pageNum="+pageNum;
			resp.sendRedirect(url);
		}
		//ordersUpdate.do
		else if(uri.indexOf("ordersUpdate.do")!=-1) {
			
			String num = req.getParameter("num");
			
			OrdersDTO dto = odao.getData(num);
			
			req.setAttribute("dto", dto);
			
			url = "/book/ordersUpdate.jsp";
			forward(req,resp,url);
			
		}
		//ordersUpdate_ok.do
		else if(uri.indexOf("ordersUpdate_ok.do")!=-1) {
			
			String num = req.getParameter("num");
			String addr = req.getParameter("addr");
			
			odao.updateData(num, addr);
			
			url = cp + "/itwillbook/orders.do?"; 
			resp.sendRedirect(url);
			
		}
		
		//checkoutDirect.do
		else if(uri.indexOf("checkoutDirect.do")!=-1) {

			ItemDTO idto = null;
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String num = req.getParameter("num");
			
			if(info==null){
				session.setAttribute("prevPage", cp + "/itwillbook/product-detail.do?num="+num); 
				url = "/book/login.jsp";
				forward(req,resp,url);
				return;
			}

			String id =info.getUserId();
			String name = req.getParameter("name");

			//Cart �ߺ� �˻�
			int i=0;
			i=idao.checkOverlap(id, name);

			idto= new ItemDTO();

			idto.setId(id);
			idto.setName(req.getParameter("name"));
			idto.setQuantity(req.getParameter("quantity"));
			idto.setPrice(req.getParameter("price"));
			idto.setSaveFileName(req.getParameter("saveFileName"));
			idto.setNum(req.getParameter("num"));

			try { //Cart�� �ߺ��Ǵ� å�� ���� ��� >> Insert��

				if(i==0) { 

					idao.insertItem(idto);

					url=cp+"/itwillbook/checkoutDirect_ok.do";
					resp.sendRedirect(url);
					return;

				}else{ //Cart�� �̹� �ߺ��Ǵ� å�� ���� ��� >>update ��

					idao.updateItemWhenOverlap(idto);

					url=cp+"/itwillbook/checkoutDirect_ok.do";
					resp.sendRedirect(url);
					return;			
				}

			} catch (Exception e) {
				System.out.println(e.toString());
			}


		}
		//checkoutDirect_ok.do
		//������ ���� ����Ʈ+������ٱ��Ͽ� �ִ°Ŷ� ���� ������
		else if(uri.indexOf("checkoutDirect_ok.do")!=-1) {

			//cart������
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id;

			if(info!=null) {
				id =info.getUserId();
			}else {
				id="";
			}
			List<ItemDTO> ilists = idao.getLists(id);
			req.setAttribute("ilists", ilists);	

			MemberDTO mdto = mdao.getReadData(id);

			List<ItemDTO> lists = idao.getLists(id);

			String imagePath = cp + "/pds/productImage";
			req.setAttribute("imagePath", imagePath);

			req.setAttribute("lists", lists);
			req.setAttribute("mdto", mdto);

			url = "/book/checkout.jsp";
			forward(req,resp,url);
		}
		//visitorDeletion.do
		else if(uri.indexOf("visitorDeletion.do")!=-1) {
			
			String userPwd =req.getParameter("userPwd");
			String r_seq = req.getParameter("r_seq");
			String userName= req.getParameter("userName");
			
			req.setAttribute("userPwd", userPwd);
			req.setAttribute("r_seq", r_seq);
			req.setAttribute("userName", userName);
			
			
			url ="/book/reviewDeletion.jsp";
			forward(req,resp,url);
			return;
				
		}
		//reviewDeletion_ok
		else if(uri.indexOf("reviewDeletion_ok")!=-1) {
		
			String r_seq=req.getParameter("r_seq");
			
			int result=redao.visitorReviewDeletion(r_seq);
			
			if(result==1) {

				redao.visitorReviewDeletion(r_seq);
				
				url = "/book/reviewDeletionComplete.jsp";
				forward(req, resp, url);

				return;
			}
			url = "/book/reviewDeletion.jsp";
			forward(req, resp, url);
			return;
		}
		

	}
}
