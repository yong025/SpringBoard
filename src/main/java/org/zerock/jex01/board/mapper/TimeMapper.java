package org.zerock.jex01.board.mapper;


import org.apache.ibatis.annotations.Select;


public interface TimeMapper {

    @Select("select now()")
    String getTime();

    String getTime2();
}
