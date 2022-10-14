package com.gabrieltintarescu.UpKeep;

import com.gabrieltintarescu.UpKeep.model.User;
import com.gabrieltintarescu.UpKeep.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * @author Gabriel Tintarescu
 * @project upkeep_server
 * @created 10/14/2022
 */
@Component
@Slf4j
public class DataMocker implements CommandLineRunner {
    final int userNumber = 110;
    final List<String> types = List.of("User", "Admin", "Banned");

    private final RestTemplate restTemplate;
    private final UserService userService;

    public DataMocker(RestTemplateBuilder restTemplateBuilder, UserService userService) {
        this.restTemplate = restTemplateBuilder.build();
        this.userService = userService;
    }



    @Override
    public void run(String... args) throws Exception {
        String url_name = "https://names.drycodes.com/" + userNumber +"?nameOptions=boy_names";
        var names = (ArrayList<String>) this.restTemplate.getForObject(url_name, ArrayList.class);
        String  url_email = "https://names.drycodes.com/" + userNumber +"?nameOptions=funnyWords";
        var emails = (ArrayList<String>) this.restTemplate.getForObject(url_email, ArrayList.class);
        List<User> usersToSave = new ArrayList<>();
        Random random = new Random();
        for (int i = 0; i < userNumber; i++) {
            var splittedName = names.get(i).split("_");
            String type = types.get(random.nextInt(types.size()));
            usersToSave.add(User.builder()
                            .name(splittedName[0] + " " + splittedName[1])
                            .email(emails.get(i).split("_")[0].toLowerCase() + "@gmail.com")
                            .phone("07" + random.nextInt(11111111, 99999999))
                            .type(type)
                    .build());
        }
        userService.saveUsers(usersToSave);
    }
}
