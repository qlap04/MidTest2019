package org.com.entity;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "users")
@NamedQueries(
        {
                @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
        }
)
public class User implements Serializable {

    @Id
    @Column(name = "username")
    private String username;

    @Column(name = "email")
    private String email;

    @Column(name = "full_name")
    private String fullName;

    @Column(name = "phone")
    private String phone;

    @Column(name = "password")
    private String password;

    @Column(name = "is_active")
    private boolean isActive;

    @Column(name = "is_admin")
    private boolean isAdmin;

    @Column(name = "images")
    private String images;

    // Relationship with Share (one user can have many shares)
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<Share> shares;

    // Relationship with Favorite (if this is a OneToMany or ManyToOne relationship, adjust accordingly)
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<Favorite> favorites;

}
