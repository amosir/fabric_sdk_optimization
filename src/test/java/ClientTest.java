/*
SPDX-License-Identifier: Apache-2.0
*/

import edu.hit.sirtian.ClientApp;
import edu.hit.sirtian.EnrollAdmin;
import edu.hit.sirtian.RegisterUser;
import org.junit.Test;

public class ClientTest {

	@Test
	public void testFabCar() throws Exception {
		EnrollAdmin.main(null);
		RegisterUser.main(null);
		ClientApp.main(null);
	}
}
