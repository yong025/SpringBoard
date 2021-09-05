package org.zerock.jex01.board.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ReplyDTO {

    private Long rno; // 나중에 jpi할 때에는 기본값이 long값이므로 미리 long값 지정
    private Long bno;
    private String replyer;
    private String reply;
    private LocalDateTime replyDate;
    private LocalDateTime modDate;
}
