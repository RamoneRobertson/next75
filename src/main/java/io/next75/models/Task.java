package io.next75.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.time.Instant;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tasks")
public class Task {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;

  @ManyToOne
  @JoinColumn(name = "list_id")
  private TaskList taskList;

  @Column(name = "description")
  private String description;

  @Column(name = "is_completed")
  private boolean isCompleted;

  @Column(name = "completed_at")
  private Instant completedAt;

  private Instant createdAt = Instant.now();
  private Instant updatedAt;

  @PreUpdate
  public void onUpdate(){
    this.updatedAt = Instant.now();
  }
}
