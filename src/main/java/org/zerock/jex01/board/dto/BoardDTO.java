package org.zerock.jex01.board.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.zerock.jex01.board.domain.Board;

import java.time.LocalDateTime;

//읽기전용
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class BoardDTO {

    private long bno;
    private String title;
    private String content;
    private String writer;
    private LocalDateTime regDate;
    private LocalDateTime modDate;

    public Board getDomain(){
        Board board = Board.builder()
                .bno(bno)
                .title(title)
                .content(content)
                .writer(writer)
                .regDate(regDate)
                .modDate(modDate)
                .build();
        return board;
    }
}
