package com.fitnesspanda.web;

import static org.assertj.core.api.Assertions.assertThat;

import com.fitnesspanda.web.dao.UserRepository;
import com.fitnesspanda.web.model.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Rollback(false)
public class UserRepositoryTests {

    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private UserRepository userRepo;

    @Test
    public void testCreateUser() {
        User user = new User();
        user.setEmail("abcd@yahoo.ro");
        user.setPassword("abcdefgh");
        user.setFirstName("Abcd");
        user.setLastName("Efgh");

        User savedUser = userRepo.save(user);
        User exitsUser = entityManager.find(User.class, savedUser.getId());

        assertThat(user.getEmail()).isEqualTo(exitsUser.getEmail());
    }
}
