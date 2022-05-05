package edu.poly.shop.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {
	@Id
	@NotBlank(message = "Tên tài khoản không được để trống")
	@Length(message = "Tên tài khoản không được quá 30 kí tự", max = 30)
	@Column(columnDefinition = "varchar(30)")
	private String username;
	@NotBlank(message = "Mật khẩu không được để trống")
	@Length(message = "Mật khẩu không được quá 30 kí tự", max = 30)
	@Column(columnDefinition = "varchar(30)")
	private String password;
	@NotBlank(message = "Họ và tên không được để trống")
	@Column(columnDefinition = "nvarchar(150)")
	private String fullname;
	@NotBlank(message = "Email không được để trống")
	@Email(message = "Email không đúng định dạng")
	@Column(columnDefinition = "varchar(150)")
	private String email;
	@Column(columnDefinition = "nvarchar(250)")
	private String photo;
	@NotBlank(message = "Địa chỉ không được để trống")
	@Column(columnDefinition = "nvarchar(255)")
	private String address;
	@Column(columnDefinition = "varchar(50)")
	@NotBlank(message = "Số điện thoại không được để trống")
	@Length(message = "Số điện thoại không được quá 10 số", max = 10)
	private String phone;
	private Boolean activated;
	private Boolean admin;
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Order> orders;
}
