 //{"Attributes":{"Attribute":[{"Name":"DisplayName","Value":"Inventory Application"},{"Name":"role","Value":"user"}]}}
 var appAttributes = JSON.parse(context.getVariable("appAttributes"))
 var attributeList = appAttributes.Attributes.Attribute
 var appAttribute = "Not found"
 
 attributeList.forEach(function(attribute) {
    if (attribute.Name == "role") {
        appAttribute = attribute.Value 
    }
 });
 
 context.setVariable("role", appAttribute)