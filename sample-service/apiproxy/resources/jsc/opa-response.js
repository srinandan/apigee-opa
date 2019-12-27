 var opa_response = JSON.parse(context.getVariable("opaResponse.content"))
 context.setVariable("opa_decision", opa_response.result.allow)