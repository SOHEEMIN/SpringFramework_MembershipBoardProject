package com.its.membershipBoard.Repository;

import com.its.membershipBoard.DTO.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void saveFile(BoardDTO boardDTO) {
        sql.insert("Board.saveFile", boardDTO);
    }

    public List<BoardDTO> findAll(long id) {
        sql.update("Board.updateHits", id);
        return sql.selectList("Board.findAll");
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.pagingList", pagingParam);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public BoardDTO findById(long id) {
        sql.update("Board.updateHits", id);
        return sql.selectOne("Board.findById", id);
    }
}
