package com.topcoder.web.pacts.ejb.PactsServices;

import javax.ejb.*;
import java.rmi.RemoteException;
import java.util.*;

/**
 * The home interface for the PACTS EJB.
 *
 * @author  Dave Pecora
 * @version 1.00, 03/06/2002 
 */

public interface PactsServicesHome extends EJBHome {
    /**
     * Creates and returns a <tt>PactsServices</tt> object.
     *
     * @return  A new <tt>PactsServices</tt> object.
     */
    PactsServices create() throws CreateException, RemoteException;
}

