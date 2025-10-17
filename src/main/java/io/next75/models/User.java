package io.next75.models;

import io.next75.enums.Gender;
import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.UUID;

public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  @Column(name = "id")
  private UUID id;

  @Column(name = "name")
  private String name;

  @Column(name = "gender")
  private Gender gender;

  private BigDecimal currentWeight;
  private BigDecimal targetWeight;
  private BigDecimal height;
  private BigDecimal calorieLimit;
  private int streak;
  private Instant createdAt;
  private Instant updatedAt;
}
