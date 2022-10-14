package com.gabrieltintarescu.UpKeep.service;

import com.gabrieltintarescu.UpKeep.model.User;
import com.gabrieltintarescu.UpKeep.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * @author Gabriel Tintarescu
 * @project upkeep_server
 * @created 10/14/2022
 */
@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;


    @Override
    public List<User> getUsers() {
        return userRepository.findAll();
    }

    @Override
    public Long userCount() {
        return userRepository.count();
    }

    @Override
    public Page<User> findUsersWithPagination(int offset, int pageSize) {
        Page<User> users = userRepository.findAll(PageRequest.of(offset, pageSize));
        return  users;
    }

    @Override
    public User saveUser(User user) {
        return null;
    }

    @Override
    public void saveUsers(List<User> users) {
        userRepository.saveAll(users);
    }

}
