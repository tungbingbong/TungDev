package com.ebanking.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ebanking.dto.MyUser;
import com.ebanking.entity.Role;
import com.ebanking.entity.User;
import com.ebanking.repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.findOneByUsername(username);
		
		if(user == null) {
			throw new UsernameNotFoundException("User "+ username +" not found!");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		for (Role role: user.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getRole()));
		}
		MyUser myUser = new MyUser(user.getUsername(), user.getPassword(), 
				true, true, true, true, authorities, user.getId());
		myUser.setFirstName(user.getFirstName());
		myUser.setLastName(user.getLastName());
		myUser.setGender(user.getGender());
		myUser.setDob(user.getDob());
		myUser.setEmail(user.getEmail());
		myUser.setPhone(user.getPhone());
		myUser.setNationality(user.getNationality());
		myUser.setCity(user.getCity());
		myUser.setAddress(user.getAddress());
		return myUser;
	}

}
