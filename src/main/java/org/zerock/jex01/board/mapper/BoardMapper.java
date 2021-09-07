package org.zerock.jex01.board.mapper;

import org.zerock.jex01.board.domain.Board;
import org.zerock.jex01.common.dto.PageRequestDTO;

import java.util.List;

public interface BoardMapper {

//    @Insert() 여기다가 안만드는게 좋음. -> 실무에서는 xml sql을 넣기 때문에

    void insert(Board board);

    List<Board> getList(PageRequestDTO pageRequestDTO);

    int getCount(PageRequestDTO pageRequestDTO);

    Board select(Long bno);

    int delete(Long bno);

    int update(Board board);

}
