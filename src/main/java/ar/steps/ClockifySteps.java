package ar.steps;

import ar.model.Root;
import com.crowdar.api.rest.APIManager;
import com.google.gson.Gson;
import cucumber.api.java.en.And;

import io.lippia.api.lowcode.variables.VariablesManager;
import org.testng.Assert;

import java.io.UnsupportedEncodingException;


public class ClockifySteps {

    @And("the response array is empty")
    public void verifyEmptyArrayResponse() {
        Object actualJsonResponse = (Object) APIManager.getLastResponse().getResponse();
        Assert.assertEquals(actualJsonResponse, "[]");

    }

    @And("^defino una variable con nombre (.*) que contenga el id de workspace cuyo nombre es (.*)$")
    public void setVariable(String key, String value){
        Gson gson = new Gson();
        Root[] listWokspaces = gson.fromJson((String) APIManager.getLastResponse().getResponse(), Root[].class);
        for (Root element : listWokspaces) {
            if (element.getName().equalsIgnoreCase(value)) {
                VariablesManager.setVariable(key, element.getId());
            }
        }
    }

}
