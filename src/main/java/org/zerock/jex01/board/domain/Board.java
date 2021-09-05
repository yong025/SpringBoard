package org.zerock.jex01.board.domain;

import lombok.*;
import org.zerock.jex01.board.dto.BoardDTO;

import java.time.LocalDateTime;

//읽기전용
@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Board { //entity라고도 부름 / 도메인은 DB와 1:1 대응

    private long bno;
    private String title,content,writer;
    private LocalDateTime regDate,modDate;

    public BoardDTO getDTO(){ //entity를 dto로 변환하기 위한 선언
        BoardDTO boardDTO = BoardDTO.builder()
                .bno(bno)
                .title(title)
                .content(content)
                .writer(writer)
                .regDate(regDate)
                .modDate(modDate)
                .build();
        return boardDTO;
    }

}
