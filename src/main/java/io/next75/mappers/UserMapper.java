package io.next75.mappers;

import io.next75.dtos.RegisterUserRequest;
import io.next75.dtos.UpdateUserRequest;
import io.next75.dtos.UserDto;
import io.next75.models.User;
import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface UserMapper {
  UserDto toDto(User user);
  User toEntity(RegisterUserRequest request);
  void updateUserEntity(UpdateUserRequest request, @MappingTarget User user);
}
