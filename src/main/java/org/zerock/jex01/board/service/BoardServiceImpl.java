package org.zerock.jex01.board.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.zerock.jex01.board.domain.Board;
import org.zerock.jex01.board.dto.BoardDTO;
import org.zerock.jex01.board.mapper.BoardMapper;
import org.zerock.jex01.common.dto.PageRequestDTO;
import org.zerock.jex01.common.dto.PageResponseDTO;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{

    private final BoardMapper boardMapper;

    @Override
    public Long register(BoardDTO boardDTO) {
        Board board = boardDTO.getDomain();

        boardMapper.insert(board);

        return board.getBno();
    }

    @Override
    public BoardDTO read(Long bno) {
        Board board = boardMapper.select(bno);

        if (board != null) { //board에 값이 들어있는 경우 getDTO로 변환한 다음 리턴.
            return board.getDTO();
        }
        return null;
    }

    @Override
    public Boolean remove(Long bno) {
        return boardMapper.delete(bno) > 0; //연산자의 값이 true / false니까 반환 가능함
    }

    @Override
    public Boolean modify(BoardDTO boardDTO) {

        return boardMapper.update(boardDTO.getDomain()) > 0 ;

    }



    @Override
    public PageResponseDTO<BoardDTO> getDTOList(PageRequestDTO pageRequestDTO) {//list에 전달 (1페이지 10개)

       List<BoardDTO> dtoList =  boardMapper.getList(pageRequestDTO).stream().map(board -> board.getDTO()).collect(Collectors.toList());
       int count = boardMapper.getCount(pageRequestDTO);

       PageResponseDTO<BoardDTO> pageResponseDTO = PageResponseDTO.<BoardDTO>builder()
               .dtoList(dtoList)
               .count(count)
               .build();

       return pageResponseDTO;
    }

}
