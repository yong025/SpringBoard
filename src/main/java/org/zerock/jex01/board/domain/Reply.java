package org.zerock.jex01.board.domain;

import jdk.vm.ci.meta.Local;
import lombok.*;

import java.time.LocalDateTime;



@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Reply {

    private Long rno; // 나중에 jpi할 때에는 기본값이 long값이므로 미리 long값 지정
    private Long bno;
    private String replyer;
    private String reply;
    private LocalDateTime replyDate;
    private LocalDateTime modDate;
}
