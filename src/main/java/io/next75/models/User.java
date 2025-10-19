package io.next75.models;

import io.next75.enums.Gender;
import jakarta.persistence.GenerationType;
import jakarta.validation.constraints.Email;
import lombok.*;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;


import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@Table(name = "users")
@Entity
@AllArgsConstructor
@NoArgsConstructor

public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private UUID id;
  private String name;
  @Email
  private String email;
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
