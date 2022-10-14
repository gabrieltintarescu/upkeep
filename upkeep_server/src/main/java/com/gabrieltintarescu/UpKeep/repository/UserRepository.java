package com.gabrieltintarescu.UpKeep.repository;

import com.gabrieltintarescu.UpKeep.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Gabriel Tintarescu
 * @project upkeep_server
 * @created 10/14/2022
 */

public interface UserRepository extends JpaRepository<User, Long> {
}
