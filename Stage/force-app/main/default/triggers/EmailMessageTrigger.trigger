//Try this and let me know. You are trying to make a blank update as update cases.

trigger EmailMessageTrigger on EmailMessage (after insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
           EmailMessageTriggerHandler.changeStatus(Trigger.new);            
        }
    } 
}