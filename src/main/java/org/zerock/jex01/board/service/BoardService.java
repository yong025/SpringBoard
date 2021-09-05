package org.zerock.jex01.board.service;

import org.zerock.jex01.board.domain.Board;
import org.zerock.jex01.board.dto.BoardDTO;
import org.zerock.jex01.common.dto.PageRequestDTO;
import org.zerock.jex01.common.dto.PageResponseDTO;

import java.util.List;

public interface BoardService {
    //DTO를 VO로 바꾸어주는 과정이 필요하다.
    //게시물이 등록되면 해당 게시물의 번호로 등록되었다고 알려주고 싶다.->
    //파라메터 수집은  DTO 형식으로
    Long register(BoardDTO boardDTO);//Long타입 반환

    PageResponseDTO<BoardDTO> getDTOList(PageRequestDTO pageRequestDTO);

    BoardDTO read(Long bno);

    Boolean remove(Long bno);//Boolean타입 반환

    Boolean modify(BoardDTO boardDTO);

}
