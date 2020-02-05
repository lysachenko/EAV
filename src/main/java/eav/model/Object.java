package eav.model;

import java.util.List;

public class Object {

    private Long objectId;
    private Long parentId;
    private Long objectTypeId;
    private String name;
    private String description;

    private List<Attribute> attributes;
    private List<ObjectReference> objectReferences;

    public Long getObjectId() {
        return objectId;
    }

    public void setObjectId(Long objectId) {
        this.objectId = objectId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Long getObjectTypeId() {
        return objectTypeId;
    }

    public void setObjectTypeId(Long objectTypeId) {
        this.objectTypeId = objectTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Attribute> getAttributes() {
        return attributes;
    }

    public void setAttributes(List<Attribute> attributes) {
        this.attributes = attributes;
    }

    public List<ObjectReference> getObjectReferences() {
        return objectReferences;
    }

    public void setObjectReferences(List<ObjectReference> objectReferences) {
        this.objectReferences = objectReferences;
    }

    @Override
    public String toString() {
        return "\nObject{" +
                "objectId=" + objectId +
                ", parentId=" + parentId +
                ", objectTypeId=" + objectTypeId +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", \nattributes=" + attributes +
                ", \nobjectReferences=" + objectReferences +
                "}";
    }
}
