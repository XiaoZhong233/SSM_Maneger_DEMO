package dao;

/**
 * 对USER-ROLE中间表进行操作
 */
public interface IUser_RoleDao {

    /**
     * 根据用户ID删除角色ID
     * @param id
     */
    void delRoleIdByUserId(String id);

    /**
     * 根据角色ID删除用户ID
     * @param id
     */
    void delUserIdByRoleId(String id);

    /**
     * 根据用户ID增加角色ID
     * @param id
     */
    void insertRoleIDByUserId(String id);

    /**
     * 根据角色ID增加用户ID
     * @param id
     */
    void insertUserIdByRoleId(String id);
}
