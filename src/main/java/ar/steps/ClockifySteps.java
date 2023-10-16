package ar.steps;

import com.crowdar.api.rest.APIManager;
import cucumber.api.java.en.And;
import org.testng.Assert;

public class ClockifySteps {

    @And("the response array is empty")
    public void verifyEmptyArrayResponse() {
        Object actualJsonResponse = (Object) APIManager.getLastResponse().getResponse();
        Assert.assertEquals(actualJsonResponse, "[]");

    }
}
