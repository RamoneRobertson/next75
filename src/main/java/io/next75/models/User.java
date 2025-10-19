package io.next75.models;

import io.next75.enums.Gender;


import java.math.BigDecimal;
import java.time.Instant;
import java.util.UUID;

public class User {
  private UUID id;
  private String name;
  private Gender gender;
  private BigDecimal currentWeight;
  private BigDecimal targetWeight;
  private BigDecimal height;
  private BigDecimal calorieLimit;
  private int streak;
  private Instant createdAt;
  private Instant updatedAt;

  public void onCreate(){
    this.createdAt = Instant.now();
    this.updatedAt = Instant.now();
  }

  public void onUpdate(){
    this.updatedAt = Instant.now();
  }
}
