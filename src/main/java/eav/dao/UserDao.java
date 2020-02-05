package eav.dao;

import eav.manager.ObjectManager;
import eav.model.Object;
import eav.names.AttributeName;
import eav.names.ObjectTypeName;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class UserDao {

    private ObjectManager objectManager;

    public UserDao(Connection connection) throws SQLException {
        this.objectManager = new ObjectManager(connection);
    }

    public Object getUser(String login, String password) throws SQLException {

        List<Object> users = objectManager.getObjectsByObjectTypeId(ObjectTypeName.TYPE_ID_USERS);
        Object user = null;

        for (Object object : users) {
            for (int j = 0; j < object.getAttributes().size(); j++) {
                if ((object.getAttributes().get(j).getAttributeTypeId().equals(AttributeName.ATTR_TYPE_ID_USERS_LOGIN)
                        && object.getAttributes().get(j).getValue().equals(login))
                        || (object.getAttributes().get(j).getAttributeTypeId().equals(AttributeName.ATTR_TYPE_ID_USERS_PASSWORD)
                        && object.getAttributes().get(j).getValue().equals(password))
                ) {
                    user = objectManager.getObjectById(object.getObjectId());
                }
            }
        }

        return user;
    }

    public Object getUserByLogin(String login) throws SQLException {
        List<Object> users = objectManager.getObjectsByObjectTypeId(ObjectTypeName.TYPE_ID_USERS);
        Object user = null;

        for (Object object : users) {
            for (int j = 0; j < object.getAttributes().size(); j++) {
                if ((object.getAttributes().get(j).getAttributeTypeId().equals(AttributeName.ATTR_TYPE_ID_USERS_LOGIN)
                        && object.getAttributes().get(j).getValue().equals(login))
                ) {
                    user = objectManager.getObjectById(object.getObjectId());
                }
            }
        }

        return user;
    }

    public List<Object> getAllStudents() throws SQLException {
        return objectManager.getObjectsByObjectTypeId(ObjectTypeName.TYPE_ID_USERS);
    }


}
