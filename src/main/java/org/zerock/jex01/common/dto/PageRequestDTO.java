package org.zerock.jex01.common.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PageRequestDTO {

    @Builder.Default // 기본값 지정
    private int page = 1;//한 페이지에
    @Builder.Default // 기본값 지정
    private int size = 10;//몇개

    public String type;
    public String keyword;

    public int getSkip(){

        return (page-1) * size;
    }

    public String getType(){

        if(type == null || type.trim().length() == 0){
            return null;
        }
        return type;
    }

    public String[] getArr(){
        return type ==null? new String[]{} : type.split("");
    }


}
