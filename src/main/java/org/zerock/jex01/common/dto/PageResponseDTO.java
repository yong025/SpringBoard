package org.zerock.jex01.common.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PageResponseDTO<E> { // test에서 사용하는 builder 문법이 달라짐.

    private List<E> dtoList; //엘리먼트타입 (임시타입) 실제 타입을 나중에 결정
    private int count;
}
