package ar.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Membership {
    public String userId;
    public Object hourlyRate;
    public Object costRate;
    public String targetId;
    public String membershipType;
    public String membershipStatus;
}
