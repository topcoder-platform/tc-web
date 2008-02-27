package com.topcoder.web.ejb.security;

import java.io.Serializable;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 21, 2008
 */
public class AuthenticatedUser implements Serializable {
    private String userName;
    private Long userId;

    AuthenticatedUser(Long userId, String userName) {
        this.userId = userId;
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public Long getUserId() {
        return userId;
    }
}