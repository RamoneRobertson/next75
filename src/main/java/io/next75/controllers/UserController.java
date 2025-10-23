package io.next75.controllers;

import io.next75.dtos.RegisterUserRequest;
import io.next75.dtos.UpdateUserRequest;
import io.next75.dtos.UserDto;
import io.next75.services.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.UUID;

@RestController
@RequestMapping("/users")
public class UserController {
  private final UserService userService;

  public UserController(UserService userService) {
    this.userService = userService;
  }

  //  CRUD ACTIONS

  // CREATE a new user
  @PostMapping("/register")
  public ResponseEntity<UserDto> registerUser (
          @RequestBody RegisterUserRequest request,
          UriComponentsBuilder uriBuilder
          ){
    var userDto = userService.registerUser(request);
    var url = uriBuilder.path("/users/profile/{id}").build().toUri();
    return ResponseEntity.created(url).body(userDto);
  }

  // READ a user
  @GetMapping("/profile/{id}")
  public ResponseEntity<UserDto> showProfile (
          @PathVariable UUID id
  ){
    return ResponseEntity.ok(userService.getUser(id));
  }

  // UPDATE a user
  @PutMapping("profile/{id}")
  public ResponseEntity<UserDto> updateProfile (
          @PathVariable UUID id,
          @RequestBody UpdateUserRequest request
  ){
    userService.updateUser(request, id);
    return ResponseEntity.ok(userService.getUser(id));
  }

  // DELETE a user
  @DeleteMapping("/profile/{id}")
  public ResponseEntity<Void> deleteProfile (@PathVariable UUID id) {
    userService.deleteUser(id);
    return ResponseEntity.noContent().build();
  }
}
