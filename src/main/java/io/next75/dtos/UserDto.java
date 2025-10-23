package io.next75.dtos;

import io.next75.enums.Gender;
import io.next75.enums.Goal;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

@Data
public class UserDto {
  private UUID id;
  private String name;
  private String email;
  private Gender gender;
  private Date birthdate;
  private int streak;
  private BigDecimal currentWeight;
  private BigDecimal targetWeight;
  private BigDecimal height;
  private BigDecimal calorieLimit;
  private Goal goal;
}
