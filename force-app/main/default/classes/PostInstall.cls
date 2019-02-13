global class PostInstallClass implements InstallHandler {
    global void onInstall(InstallContext context) {

        for (PermissionSetAssignment assignments : [SELECT PermissionSet.Name, AssigneeId, Assignee.Name FROM PermissionSetAssignment WHERE PermissionSet.Name = 'MyPermSet']){
            
        }
    }
}
