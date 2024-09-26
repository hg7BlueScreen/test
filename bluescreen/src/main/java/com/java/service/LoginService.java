package com.java.service;

import com.java.dto.BMember;

public interface LoginService {

	BMember selectLogin(String id, String pw);

}
