package com.fitnesspanda.web.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/styles/**").permitAll()
                .antMatchers("/assets/**").permitAll()
                .antMatchers("/sign_up").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin().loginPage("/login").usernameParameter("email").permitAll();
    }


}
