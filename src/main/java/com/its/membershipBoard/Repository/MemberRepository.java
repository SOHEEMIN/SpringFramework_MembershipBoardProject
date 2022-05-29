package com.its.membershipBoard.Repository;

import com.its.membershipBoard.DTO.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void saveFile(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        sql.insert("Member.saveFile", memberDTO);
    }

    public String duplicateCheck(String memberId) {
        return sql.selectOne("Member.duplicateCheck", memberId);
    }

    public List<MemberDTO> findAll(long m_id) {
        return sql.selectList("Member.findAll");
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }

    public void delete(long m_id) {
        sql.delete("Member.delete", m_id);
    }
}
