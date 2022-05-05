package edu.poly.shop.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Products")
public class Product implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@NotBlank(message = "Tên sản phẩm không được để trống")
	@Column(columnDefinition = "nvarchar(250)")
	private String name;
	@Column(columnDefinition = "nvarchar(250)")
	private String image;
	@Column(columnDefinition = "nvarchar(500)")
	private String status;
	@Min(message = "Giá tiền phải lớn 0", value = 0)
	@NotNull(message = "Giá tiền không được để trống")
	private Double price;
	@Min(message = "Số lượng sản phẩm phải lớn 0", value = 0)
	@NotNull(message = "Số lượng sản phẩm không được để trống")
	private Integer quantity;
	@NotNull(message = "Giảm giá không được để trống")
	private Integer discount;
	@Temporal(TemporalType.DATE)
	@Column(name = "Createdate")
	Date createDate = new Date();
	private Boolean available;
	@ManyToOne
	@JoinColumn(name = "Categoryid")
	Category category;
	@JsonIgnore
	@OneToMany(mappedBy = "product")
	List<OrderDetail> orderDetails;
}