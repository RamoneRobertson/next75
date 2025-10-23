package io.next75.services;

import io.next75.dtos.RegisterUserRequest;
import io.next75.dtos.UpdateUserRequest;
import io.next75.dtos.UserDto;
import io.next75.mappers.UserMapper;
import io.next75.repositories.UserRepository;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@AllArgsConstructor

public class UserService {
  private final UserMapper userMapper;
  private final UserRepository userRepository;


  public UserDto registerUser(RegisterUserRequest request) {
    var user = userMapper.toEntity(request);
    userRepository.save(user);
    return  userMapper.toDto(user);
  }

  public UserDto getUser(UUID id){
    var user = userRepository.findById(id).orElseThrow();
    return userMapper.toDto(user);
  }

  public void updateUser(UpdateUserRequest request, UUID id){
    var user = userRepository.findById(id).orElseThrow();
    userMapper.updateUserEntity(request, user);
    userRepository.save(user);
  }

  public void deleteUser(UUID id){
    var user = userRepository.findById(id).orElseThrow();
    userRepository.delete(user);
  }
}
