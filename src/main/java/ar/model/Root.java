package ar.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;

@Setter
@Getter
public class Root {
    public String id;
    public String name;
    public Rate hourlyRate;
    public Rate costRate;
    public ArrayList<Membership> memberships;
    public WorkspaceSettings workspaceSettings;
    public String imageUrl;
    public String featureSubscriptionType;
}
