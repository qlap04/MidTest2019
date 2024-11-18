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
@Table(name = "category")
@NamedQueries(
        {
                @NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c"),
                @NamedQuery(name = "Category.findByCode", query = "SELECT c FROM Category c WHERE c.code = :code")
        }
)
public class Category implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "category_name")
    private String categoryName;

    @Column(name = "code")
    private String code;

    @Column(name = "images")
    private String images;

    @Column(name = "status")
    private boolean status;

    @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
    private List<Video> videos;

}
