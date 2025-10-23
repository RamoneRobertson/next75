package io.next75.dtos;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class UpdateUserRequest {
  private String name;
  private String email;
  private Date birthdate;
  private BigDecimal currentWeight;
  private BigDecimal targetWeight;
  private BigDecimal height;
  private BigDecimal calorieLimit;
}
