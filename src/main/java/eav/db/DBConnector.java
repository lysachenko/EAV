package eav.db;

import eav.manager.AttrTypeManager;
import eav.manager.AttributesManager;
import eav.manager.ObjTypeManager;
import eav.model.AttrType;
import eav.model.Attribute;
import eav.model.ObjType;
import eav.names.ObjectTypeName;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {

    // Блок объявления констант
    public static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    public static final String DB_Driver = "oracle.jdbc.driver.OracleDriver";
    public static final String USERNAME = "dbuser";
    public static final String PASSWORD = "dbuser";

    public static void main(String[] args) {
        try {
            Class.forName(DB_Driver); //Проверяем наличие JDBC драйвера для работы с БД
            Connection connection = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);//соединениесБД
            System.out.println("Соединение с СУБД выполнено.");

            ObjTypeManager objTypeManager = new ObjTypeManager(connection);
            ObjType objType = new ObjType();
            objType.setObjectTypeId(20L);
            objType.setParentId(1L);
            objType.setCode("new Code");
            objType.setName("Name");
            objType.setDescription("desc");
            objTypeManager.createObjType(objType);

            /*AttrTypeManager attrTypeManager = new AttrTypeManager(connection);
            AttrType attrType = new AttrType();
            attrType.setAttributeTypeId(190L);
            attrType.setObjectTypeId(1L);
            attrType.setObjectTypeIdRefer(1L);
            attrType.setName("kyky");
            attrType.setCode(null);

            System.out.println(attrTypeManager.getAllAttrTypeByObjectTypeId(1L));
*/
            /*AttributesManager attributesManager = new AttributesManager(connection);

            Attribute attribute = new Attribute();
            attribute.setAttributeTypeId(2L);
            attribute.setObjectId(1L);


            attributesManager.createAttribute(attribute);*/
            //attributesManager.deleteAttributeByObjectIdAndAttributeId(2L, 12L);

            //System.out.println(attributesManager.getAttributesByObjectId(2L));

            /*Attribute attribute = new Attribute();
            attribute.setAttributeTypeId(2L);
            attribute.setObjectId(1L);
            attribute.setValue("sec");
            //attribute.setDate(new Date(20021));

            attributesManager.createAttribute(attribute);*/

            /*Attribute attribute1 = new Attribute();
            attribute1 = attributesManager.getAttributeById(1L);
            System.out.println(attribute1);*/

            connection.close();       // отключение от БД
            System.out.println("Отключение от СУБД выполнено.");
        } catch (SQLException e) {
            e.printStackTrace(); // обработка ошибок  DriverManager.getConnection
            System.out.println("Ошибка SQL !");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Нет драйвера");
        }
    }

}
