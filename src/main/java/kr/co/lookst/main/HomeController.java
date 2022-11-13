package kr.co.lookst.main;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.service.indexService;


@Controller
public class HomeController {
	
	@Autowired
	indexService indexService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		try {

			List<Product> new_prdt= indexService.getnewProducts();

			model.addAttribute("new_prdt", new_prdt);
			System.out.println(new_prdt);
			System.out.println(model);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "home";
	}
	
}
