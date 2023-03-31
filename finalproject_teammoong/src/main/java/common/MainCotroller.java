package common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainCotroller {

	@RequestMapping(value = "/main.do")
	public String mainPage() {
		return "common/main";
	}
}
