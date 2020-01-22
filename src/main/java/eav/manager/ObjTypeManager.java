package eav.manager;

import eav.model.ObjType;
import eav.utils.ObjTpyteQueries;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ObjTypeManager {

    public final static String OBJECT_TYPE_ID = "OBJECT_TYPE_ID";
    public final static String PARENT_ID = "PARENT_ID";
    public final static String CODE = "CODE";
    public final static String NAME = "NAME";
    public final static String DESCRIPTION = "DESCRIPTION";

    private Connection conn;

    public void createObjType(ObjType objType) throws SQLException {

        PreparedStatement preparedStmt = conn.prepareStatement(ObjTpyteQueries.INSERT_NEW_OBJECT_TYPE);
        preparedStmt.setLong(1, objType.getObjectTypeId());
        preparedStmt.setLong(2, objType.getParentId());
        preparedStmt.setString(3, objType.getCode());
        preparedStmt.setString(4, objType.getName());
        preparedStmt.setString(5, objType.getDescription());

        preparedStmt.execute();

        conn.close();
    }

   /* public ObjType getObjectTypeById(int id) throws SQLException {
        ObjType objType = new ObjType();
        PreparedStatement preparedStmt = conn.prepareStatement(ObjTpyteQueries.SELECT_OBJECT_TYPE_BY_ID);
        preparedStmt.setInt(1, id);

        ResultSet rs = preparedStmt.executeQuery();

        while (rs.next()) {
            objType.setObjectTypeId(rs.getInt(OBJECT_TYPE_ID));
            objType.setParentId(rs.getInt(PARENT_ID));
            objType.setCode(rs.getString(CODE));
            objType.setName(rs.getString(NAME));
            objType.setDescription(rs.getString(DESCRIPTION));
        }

        conn.close();
        return objType;
    }

    public List<ObjType> getAllObjectTypes() throws SQLException {
        ObjType objType = new ObjType(); //!!!!!!!!!1
        List<ObjType> listOfObjTypes = new ArrayList<ObjType>();

        Statement statement = conn.createStatement();
        ResultSet rs = statement.executeQuery(ObjTpyteQueries.SELECT_ALL_OBJECT_TYPES);

        while (rs.next()) {
            objType.setObjectTypeId(rs.getInt(OBJECT_TYPE_ID));
            objType.setParentId(rs.getInt(PARENT_ID));
            objType.setCode(rs.getString(CODE));
            objType.setName(rs.getString(NAME));
            objType.setDescription(rs.getString(DESCRIPTION));

            listOfObjTypes.add(objType);
        }
        conn.close();
        return listOfObjTypes;
    }

    public void deleteObjectTypeById(int id) throws SQLException {
        PreparedStatement preparedStmt = conn.prepareStatement(ObjTpyteQueries.DELETE_OBJECT_BY_ID); //ON CASCADE DELETE
        preparedStmt.setInt(1, id);

        preparedStmt.execute();

        conn.close();
    }*/


}
