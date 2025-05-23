package com.end2end.spring.works.dao;

import com.end2end.spring.board.dto.NoticeDTO;
import com.end2end.spring.employee.dto.EmployeeDTO;
import com.end2end.spring.works.dto.ProjectDTO;
import com.end2end.spring.works.dto.ProjectInsertDTO;
import com.end2end.spring.works.dto.ProjectSelectDTO;
import com.end2end.spring.works.dto.ProjectUserDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProjectDAO {

    @Autowired
    private SqlSession mybatis;

    public int insert(ProjectDTO dto) {
        return mybatis.insert("project.insertProject", dto);

    }

    //    public List<EmployeeDTO>
//    selectProjectMemberProfiles(int id) {
//        return mybatis.selectList("project.selectProjectMemberProfiles",id);
//
//    }


    public List<ProjectDTO> selectAll() {

        return mybatis.selectList("project.selectAll");

    }

    //    public List<ProjectSelectDTO> selectAllFromTo(int start, int end) {
//        Map<String, Object> map = new HashMap<>();
//        map.put("start", start);
//        map.put("end", end);
//
//        return mybatis.selectList("project.selectAllFromTo", map);
//    }
    public int deleteProjectMember(ProjectUserDTO dto) {
        return mybatis.delete("project.deleteProjectMember", dto);
    }

    public List<EmployeeDTO> getMembersByProjectId(int projectId) {
        return mybatis.selectList("project.getMembersByProjectId", projectId);
    }

    public void update(ProjectInsertDTO dto) {
        mybatis.update("project.updateById", dto);
    }

    public void endworks(int projectId) {
        mybatis.update("project.updateStatusByProjectId", projectId);
    }

    public ProjectDTO findLatestProject() {
        return mybatis.selectOne("project.findLatestProject");
    }

    public int deleteById(int id) {
        return mybatis.delete("project.deleteBySeq", id);
    }

    public ProjectDTO selectById(int id) {

        return mybatis.selectOne("project.selectById", id);
    }

    public List<EmployeeDTO> selectByUser(String target) {
        return mybatis.selectList("project.selectByUser", target);
    }


    public int hideById(int projectId, String convertedHideYn) {
        Map<String, Object> params = new HashMap<>();
        params.put("projectId", projectId);
        params.put("hideYn", convertedHideYn);
//        System.out.println("dao"+params);
        return mybatis.update("project.hideById", params);
    }

    public ProjectDTO selectProjectDeadLine(int id) {
        return mybatis.selectOne("project.selectProjectDeadLine", id);
    }
}
