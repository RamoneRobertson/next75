package io.next75.models;

import io.next75.enums.Gender;
import io.next75.enums.Goal;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import lombok.*;
import org.springframework.data.relational.core.mapping.Table;


import java.math.BigDecimal;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Table(name = "users")
@Getter
@Setter
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private UUID id;

  @Column(name = "name")
  private String name;

  @Email
  private String email;

  @Column(name = "password")
  private String password;

  @Column(name = "gender")
  private Gender gender;

  @Column(name = "birthdate")
  private Date birthDate;

  @Column(name = "current_weight")
  private BigDecimal currentWeight;

  @Column(name = "target_weight")
  private BigDecimal targetWeight;

  @Column(name = "height")
  private BigDecimal height;

  @Column(name = "calorie_limit")
  private BigDecimal calorieLimit;

  @Column(name = "streak")
  private int streak;

  @Column(name = "goal")
  private Goal goalType;

  @OneToMany(mappedBy = "user")
  private List<TaskList> taskLists;


  @Column(name = "created_at")
  private Instant createdAt;

  @Column(name = "updated_at")
  private Instant updatedAt;

  public void onCreate(){
    this.createdAt = Instant.now();
    this.updatedAt = Instant.now();
  }

  @PreUpdate
  public void onUpdate(){
    this.updatedAt = Instant.now();
  }
}
