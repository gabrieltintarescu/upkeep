package com.gabrieltintarescu.UpKeep.service;

import com.gabrieltintarescu.UpKeep.model.User;
import com.gabrieltintarescu.UpKeep.model.UserPageResponse;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * @author Gabriel Tintarescu
 * @project upkeep_server
 * @created 10/14/2022
 */
public interface UserService {
    List<User> getUsers();
    Long userCount();
    Page<User> findUsersWithPagination(int offset, int pageSize);
    User saveUser(User user);
    User editUser(User user);
    void saveUsers(List<User> users);
}
