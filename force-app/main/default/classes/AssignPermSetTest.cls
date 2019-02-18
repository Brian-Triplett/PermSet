@isTest
public with sharing class AssignPermSetTest {

    @isTest
    public static void testPostInstall() {

        // This is terrible and assumes you've already installed the permission sets
        // and created a user with 'MyPermSet' assigned. 
        PermissionSet existingPerm = [SELECT Id, Name FROM PermissionSet WHERE Name = 'MyPermSet' LIMIT 1]; 

        PermissionSet newPerm = [SELECT Id, Name FROM PermissionSet WHERE Name = 'MyPermSet' LIMIT 1];
        
        User testUser = [SELECT Id FROM User WHERE LastName = 'TestUser' LIMIT 1];

        PermissionSetAssignment assignment = new PermissionSetAssignment(
            AssigneeId = testUser.Id,
            PermissionSetId = existingPerm.Id
        );

        AssignPermSet test = new AssignPermSet();
        test.onInstall(null);

    }
}
