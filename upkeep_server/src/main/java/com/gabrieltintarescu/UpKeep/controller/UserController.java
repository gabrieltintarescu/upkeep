package com.gabrieltintarescu.UpKeep.controller;

import com.gabrieltintarescu.UpKeep.model.User;
import com.gabrieltintarescu.UpKeep.model.UserPageResponse;
import com.gabrieltintarescu.UpKeep.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

/**
 * @author Gabriel Tintarescu
 * @project upkeep_server
 * @created 10/14/2022
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/users")
public class UserController {

    private final UserService userService;

    @GetMapping
    private UserPageResponse getUsers(){
        var users = userService.getUsers();
        return UserPageResponse.builder()
                .count(users.size())
                .users(users)
                .build();
    }

    @GetMapping("/{offset}/{pageSize}")
    private UserPageResponse getProductsWithPagination(@PathVariable int offset, @PathVariable int pageSize) {
        Page<User> usersWithPagination = userService.findUsersWithPagination(offset, pageSize);
        return UserPageResponse.builder()
                .count(userService.userCount())
                .users(usersWithPagination.getContent())
                .build();
    }

    @PostMapping("/save")
    public User saveUser(@RequestBody User user) {
        return userService.saveUser(user);
    }

    @PostMapping("/edit")
    public User editUser(@RequestBody User user) {
        return userService.editUser(user);
    }
}
