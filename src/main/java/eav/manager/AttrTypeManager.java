package eav.manager;

import eav.model.AttrType;
import eav.queries.AttrTypeQueries;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AttrTypeManager {

    public final static String ATTR_ID = "ATTR_ID";
    public final static String OBJECT_TYPE_ID = "OBJECT_TYPE_ID";
    public final static String OBJECT_TYPE_ID_REF = "OBJECT_TYPE_ID_REF";
    public final static String CODE = "CODE";
    public final static String NAME = "NAME";

    public AttrTypeManager(Connection connection) {
        this.connection = connection;
    }

    private Connection connection;

    public void createAttrType(AttrType attrType) throws SQLException {
        PreparedStatement preparedStmt = connection.prepareStatement(AttrTypeQueries.INSERT_NEW_ATTR_TYPE);
        preparedStmt.setLong(1, attrType.getAttributeTypeId());
        preparedStmt.setLong(2, attrType.getObjectTypeId());
        preparedStmt.setLong(3, attrType.getObjectTypeIdRefer());
        preparedStmt.setString(4, attrType.getCode());
        preparedStmt.setString(5, attrType.getName());

        preparedStmt.execute();

        connection.close();
    }

    public List<AttrType> getAllAttrType() throws SQLException {
        List<AttrType> attrTypes = new ArrayList<AttrType>();
        PreparedStatement preparedStmt = connection.prepareStatement(AttrTypeQueries.SELECT_ALL_ATTR_TYPES);

        ResultSet rs = preparedStmt.executeQuery();

        while (rs.next()) {
            AttrType attrType = new AttrType();
            attrType.setAttributeTypeId(rs.getLong(ATTR_ID));
            attrType.setObjectTypeId(rs.getLong(OBJECT_TYPE_ID));
            attrType.setObjectTypeIdRefer(rs.getLong(OBJECT_TYPE_ID_REF));
            attrType.setCode(rs.getString(CODE));
            attrType.setName(rs.getString(NAME));
            attrTypes.add(attrType);
        }

        connection.close();
        return attrTypes;
    }

    public AttrType getAttrTypeById(int id) throws SQLException {
        AttrType attrType = new AttrType();
        PreparedStatement preparedStmt = connection.prepareStatement(AttrTypeQueries.SELECT_ATTR_TYPE_BY_ID);
        preparedStmt.setInt(1, id);

        ResultSet rs = preparedStmt.executeQuery();

        while (rs.next()) {
            attrType.setAttributeTypeId(rs.getLong(ATTR_ID));
            attrType.setObjectTypeId(rs.getLong(OBJECT_TYPE_ID));
            attrType.setObjectTypeIdRefer(rs.getLong(OBJECT_TYPE_ID_REF));
            attrType.setCode(rs.getString(CODE));
            attrType.setName(rs.getString(NAME));
        }

        connection.close();
        return attrType;
    }

    public List<AttrType> getAllAttrTypeByObjectTypeId(Long objectTypeId) throws SQLException {
        List<AttrType> listOfAttrTypes = new ArrayList<AttrType>();

        PreparedStatement statement = connection.prepareStatement(AttrTypeQueries.SELECT_ATTR_TYPE_BY_OBJECT_TYPE_ID);
        statement.setLong(1, objectTypeId);

        ResultSet rs = statement.executeQuery();

        while (rs.next()) {
            AttrType attrType = new AttrType();
            attrType.setAttributeTypeId(rs.getLong(ATTR_ID));
            attrType.setObjectTypeId(rs.getLong(OBJECT_TYPE_ID));
            attrType.setObjectTypeIdRefer(rs.getLong(OBJECT_TYPE_ID_REF));
            attrType.setCode(rs.getString(CODE));
            attrType.setName(rs.getString(NAME));

            listOfAttrTypes.add(attrType);
        }
        connection.close();
        return listOfAttrTypes;
    }

    public void updateAttrTypeById(AttrType attrType, Long attrId) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement(AttrTypeQueries.UPDATE_ATTRTYPE_BY_ID);
        preparedStatement.setLong(1, attrType.getAttributeTypeId());
        preparedStatement.setLong(2, attrType.getObjectTypeId());
        preparedStatement.setLong(3, attrType.getObjectTypeIdRefer());
        preparedStatement.setString(4, attrType.getCode());
        preparedStatement.setString(5, attrType.getName());
        preparedStatement.setLong(6, attrId);

        preparedStatement.execute();

        connection.close();
    }

}
