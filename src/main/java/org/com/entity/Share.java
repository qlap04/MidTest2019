package org.com.entity;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "shares")
@NamedQueries(
        {
                @NamedQuery(name = "Share.findAll", query = "SELECT s FROM Share s"),
                @NamedQuery(name = "Share.findByVideoId", query = "SELECT s FROM Share s WHERE s.videoId = :videoId")
        }
)
public class Share implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "shared_date")
    private Date sharedDate;

    @Column(name = "emails")
    private String emails;

    // Relationship to User: One Share is related to one User
    @ManyToOne
    @JoinColumn(name = "username", referencedColumnName = "username")
    private User user;

    // Optional: If you want to keep videoId as a field for reference (not used for updating)
    @Column(name = "video_id", insertable = false, updatable = false)
    private Long videoId;

    // Relationship to Video: One Share is related to one Video
    @ManyToOne
    @JoinColumn(name = "video_id", referencedColumnName = "id")
    private Video video;

}
