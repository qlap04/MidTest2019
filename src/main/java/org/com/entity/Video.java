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
@Table(name = "videos")
@NamedQueries(
        {
                @NamedQuery(name = "Video.findAll", query = "SELECT v FROM Video v"),
                @NamedQuery(
                        name = "Video.findByCategoryId",
                        query = "SELECT v FROM Video v WHERE v.category.id = :categoryId"
                )
        }
)
public class Video implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name = "poster")
    private String poster;

    @Column(name = "views")
    private int views;

    @Column(name = "description")
    private String description;

    @Column(name = "is_active")
    private boolean isActive;

    @ManyToOne
    @JoinColumn(name = "category_id", referencedColumnName = "id")
    private Category category;

    @OneToMany(mappedBy = "video", fetch = FetchType.LAZY)
    private List<Favorite> favorites;

    @OneToMany(mappedBy = "video", fetch = FetchType.LAZY)
    private List<Share> shares;
}
