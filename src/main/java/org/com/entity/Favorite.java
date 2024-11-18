package org.com.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "favorites")
@NamedQueries(
        {
                @NamedQuery(name = "Favorite.findAll", query = "SELECT f FROM Favorite f"),
                @NamedQuery(
                        name = "Favorite.findByVideoId",
                        query = "SELECT f FROM Favorite f WHERE f.videoId = :videoId"
                )
        }
)
public class Favorite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "liked_date")
    private Date likedDate;

    @Column(name = "video_id")
    private int videoId;

    @ManyToOne
    @JoinColumn(name = "username", referencedColumnName = "username")
    private User user;

    @ManyToOne
    @JoinColumn(name = "video_id", referencedColumnName = "id", insertable = false, updatable = false)
    private Video video;  // Add the reference to Video entity
}
