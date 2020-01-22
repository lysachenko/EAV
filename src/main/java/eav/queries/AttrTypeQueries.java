package eav.queries;

public class AttrTypeQueries {

    public static final String INSERT_NEW_ATTR_TYPE =
            "INSERT INTO ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, OBJECT_TYPE_ID_REF, CODE, NAME) VALUES(?, ?, ?, ?, ?)";

    public static final String SELECT_ALL_ATTR_TYPES =
            "SELECT ATTR_ID, OBJECT_TYPE_ID, OBJECT_TYPE_ID_REF, CODE, NAME FROM ATTRTYPE";
    public static final String SELECT_ATTR_TYPE_BY_ID =
            "SELECT ATTR_ID, OBJECT_TYPE_ID, OBJECT_TYPE_ID_REF, CODE, NAME FROM ATTRTYPE WHERE ATTR_ID = ?";
    public static final String SELECT_ATTR_TYPE_BY_OBJECT_TYPE_ID =
            "SELECT ATTR_ID, OBJECT_TYPE_ID, OBJECT_TYPE_ID_REF, CODE, NAME FROM ATTRTYPE WHERE OBJECT_TYPE_ID = ?";

    public static final String UPDATE_ATTRTYPE_BY_ID =
            "update ATTRTYPE set ATTR_ID = ?, OBJECT_TYPE_ID = ?, OBJECT_TYPE_ID_REF = ?, CODE = ?, NAME = ? " +
                    "where ATTR_ID = ?";
    public static final String UPDATE_ATTRTYPE_CODE_BY_ID =
            "update ATTRTYPE set CODE = ? where ATTR_ID = ?";
    public static final String UPDATE_ATTRTYPE_NAME_BY_ID =
            "update ATTRTYPE set NAME = ? where ATTR_ID = ?";

    public static final String DELETE_ATTR_TYPE_BY_ID
            = "delete from ATTRTYPE where ATTR_ID = ?";

    public static final String DELETE_ATTR_TYPE_BY_OBJECT_TYPE_ID
            = "delete from ATTRTYPE where OBJECT_TYPE_ID = ?";

}
