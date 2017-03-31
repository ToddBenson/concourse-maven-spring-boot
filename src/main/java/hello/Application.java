package hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}


	String generateSecretToken() {
		Random r = new Random();
		return Long.toHexString(r.nextLong());
	}

}
