global class AssignPermSet implements InstallHandler {
    global void onInstall(InstallContext context) {

        // Obtains the new permission set to assign
        PermissionSet newPerm = [SELECT Id FROM PermissionSet WHERE Name = 'NewPermSet' LIMIT 1];

        // Goes through all the users assigned to MyPermSet and also assigns NewPermSet to them
        List<PermissionSetAssignment> newAssignments = new List<PermissionSetAssignment>();
        for (PermissionSetAssignment assignment : [SELECT PermissionSet.Name, AssigneeId, Assignee.Name FROM PermissionSetAssignment WHERE PermissionSet.Name = 'MyPermSet']){
            newAssignments.add(new PermissionSetAssignment(
                PermissionSetId = newPerm.Id,
                AssigneeId = assignment.AssigneeId
            ));
        }

        insert newAssignments;
    }
}
