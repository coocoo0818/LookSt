//package kr.co.lookst.post;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//public class CartCookie extends HttpServlet{
//		private static final long serialVersionUID = 1L;
//	
//	public CartCookie() {
//		super();
//	}
//		// protected : 상속 받은 클래스에서 접근 가능 (인스턴스 변수와 함수를 정의할때 사용하는 점근자)
//		protected void cartCookie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//			request.setCharacterEncoding("utf-8");
//			String[] prdtcart = request.getParameterValues("prdtcart");
//			System.out.println(prdtcart.length);
//			
//			// sessionScope : context(webTesting) 안에 모든 page에서 공유
//			// response : 쿠키 설정(저장), request : 쿠키 읽기
//			
//			if(prdtcart.length !=0 ) {
//				for(int i=0; i < prdtcart.length; i++) {
//					// key, value
//					String key = "prdtcart" + (i+1);
//					String value = prdtcart[i];
//					System.out.println(key + "\t" + value);
//					
////					Cookie cookie = new Cookie(key, value);
//				}
//			}
//		}
//		
//   
//}