package io.next75.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


import java.math.BigDecimal;
import java.time.Instant;

@Table(name = "meals")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
public class Meal {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;

  @ManyToOne
  @JoinColumn(name = "user_id")
  private User user;

  @Column(name = "name")
  private String name;

  @Column(name = "calories")
  private BigDecimal calories;

  private Instant createdAt = Instant.now();
  private Instant updatedAt;

  @PreUpdate
  public void onUpdate(){
    this.updatedAt = Instant.now();
  }
}
