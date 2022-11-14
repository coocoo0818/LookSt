package kr.co.lookst.main;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.lookst.main.domain.IndexDto;
import kr.co.lookst.main.domain.Prdt_Img;
import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.StylePickDto;
import kr.co.lookst.main.service.indexService;


@Controller
public class HomeController {
	
	@Autowired
	indexService indexService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		try {
			List<IndexDto> new_prdt = indexService.getnewProductsInfo();
			List<StylePickDto> stylePick = indexService.getStylePicks();
			
			model.addAttribute("new_prdt", new_prdt);
			model.addAttribute("stylePick", stylePick);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "home";
	}
	
}
