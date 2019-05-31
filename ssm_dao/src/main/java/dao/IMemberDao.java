package dao;

import domain.Member;

public interface IMemberDao {

    Member findMemberById(String id);
}
