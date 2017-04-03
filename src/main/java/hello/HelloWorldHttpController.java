package hello;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HelloWorldHttpController {

    @RequestMapping("/greeting")
    public String greeting(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
        model.addAttribute("name", name);
        String token = new Application().generateSecretToken();
        System.out.print(token);
        if (true){
            int r = 4 + 5;
            System.out.print(r);
            String token2 = new Application().generateSecretToken();
            System.out.print(token2);
        }
        else {
            int r =1;
            System.out.print(r);
        }

        return "greeting" + token;
    }
}
