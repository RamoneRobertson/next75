package io.next75.dtos;

import io.next75.enums.Gender;
import io.next75.enums.Goal;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class RegisterUserRequest {
  private String name;
  private String email;
  private String password;
  private Date birthdate;
  private Gender gender;
  private Goal goal;
  private BigDecimal currentWeight;
  private BigDecimal targetWeight;
  private BigDecimal height;
}
