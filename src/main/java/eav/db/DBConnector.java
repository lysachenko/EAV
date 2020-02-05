package eav.db;

import eav.manager.ObjectManager;
import eav.model.Attribute;
import eav.model.Object;
import eav.names.AttributeName;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

            /*UserDao userDao = new UserDao();

            Object user = userDao.getUser("qwe","qwe");
            Object user2 = userDao.getUserByLogin("qwe");
            List<Object> students = userDao.getAllStudents();

            System.out.println(students);
*/
            ObjectManager objectManager = new ObjectManager(connection);

            Object object = new Object();
            object.setObjectTypeId(1L);
            // object.setParentId(null);
            object.setName("Student1");

            List<Attribute> attributes = new ArrayList<Attribute>();

            /*Attribute login = new Attribute();
            login.setAttributeTypeId(AttributeName.ATTR_TYPE_ID_USERS_LOGIN);
            login.setValue("new_login@gmail.com");
            attributes.add(login);*/

            Attribute passWord = new Attribute();
            passWord.setAttributeTypeId(AttributeName.ATTR_TYPE_ID_USERS_PASSWORD);
            passWord.setValue("pass");
            attributes.add(passWord);

            /*Attribute archive = new Attribute();
            archive.setAttributeTypeId(AttributeName.ATTR_TYPE_ID_USERS_ARCHVIVE);
            archive.setValue(null);
            attributes.add(archive);*/

            /*Attribute role = new Attribute();
            role.setAttributeTypeId(AttributeName.ATTR_TYPE_ID_USERS_ROLE_ID);
            role.setValue("User");
            attributes.add(role);*/

            object.setAttributes(attributes);

            //objectManager.createObject(object);
            //System.out.println(objectManager.getObjectById(82L));
            //objectManager.updateObjectById(object, 82L);
            //objectManager.deleteObjectById(82L);

            /*List<ObjectReference> objectReferences = new ArrayList<>();
            ObjectReferenceManager objectReferenceManager = new ObjectReferenceManager();
            ObjectReference objectReference = new ObjectReference();
            objectReference.setAttrId(2L);
            //objectReference.setReference(68L);
            objectReference.setObjectId(70L);
            //objectReferenceManager.createObjectReference(objectReference);
            objectReferences.add(objectReference);*/

            //object.setObjectReferences(objectReferences);

            objectManager.deleteObjectReferenceByReferenceIdAndObjectId(21L, 72L);

            //objectManager.createObject(object);

            //System.out.println(objectManager.getAllObjects());

            /*ObjTypeManager objTypeManager = new ObjTypeManager(connection);
            ObjType objType = new ObjType();
            objType.setObjectTypeId(22L);
            objType.setParentId(null);
            objType.setCode("newCode0");
            objType.setName("Name");
            objType.setDescription("desc");
            objTypeManager.createObjType(objType);*/

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
