package io.next75.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.Instant;
import java.util.UUID;

@Table(name = "photos")
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Photo {
  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private UUID id;

  @ManyToOne
  @JoinColumn(name = "user_id")
  private User user;

  @Column(name = "url")
  private String url;

  @Column(name = "upload_date")
  private Instant uploadDate = Instant.now();

  @Column(name = "created_at")
  private Instant createdAt = Instant.now();

  @Column(name = "updated_at")
  private Instant updatedAt;

  @PreUpdate
  public void onUpdate(){
    this.updatedAt = Instant.now();
  }
}
