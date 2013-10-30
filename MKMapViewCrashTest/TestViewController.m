//
//  TestViewController.m
//  MKMapViewCrashTest
//
//------------------------------------------------------------------------------

#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

#import "TestViewController.h"

@interface TestViewController () <ABPeoplePickerNavigationControllerDelegate> {
    
    MKMapView *mMKMapView;

}

@end

@implementation TestViewController

//------------------------------------------------------------------------------
- (void)viewDidLoad
//------------------------------------------------------------------------------
{
    [super viewDidLoad];
    
    self.view.backgroundColor= [UIColor redColor];

    {
        UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame= CGRectMake( 20, 88, 280, 44 );
        button.layer.borderColor= [[UIColor blackColor] CGColor];
        button.layer.borderWidth= 2;
        button.layer.cornerRadius= 9.0;
        button.layer.masksToBounds= YES;
        button.backgroundColor= [UIColor blueColor];
        [button setTitle:@"Add Map to View" forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:24]];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector( addMapToViewPressed ) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:button];
    }
    {
        UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame= CGRectMake( 20, 88+44+20, 280, 44 );
        button.layer.borderColor= [[UIColor blackColor] CGColor];
        button.layer.borderWidth= 2;
        button.layer.cornerRadius= 9.0;
        button.layer.masksToBounds= YES;
        button.backgroundColor= [UIColor blueColor];
        [button setTitle:@"Show Contacts" forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:24]];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector( showContactsPressed ) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:button];
    }
}

//------------------------------------------------------------------------------
- (void)addMapToViewPressed
//------------------------------------------------------------------------------
{
    mMKMapView= [[MKMapView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:mMKMapView];
    
    {
        UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame= CGRectMake( 20, 88, 280, 44 );
        button.layer.borderColor= [[UIColor blackColor] CGColor];
        button.layer.borderWidth= 2;
        button.layer.cornerRadius= 9.0;
        button.layer.masksToBounds= YES;
        button.backgroundColor= [UIColor blueColor];
        [button setTitle:@"Remove Map" forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:24]];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector( removeMapPressed ) forControlEvents:UIControlEventTouchDown];
        [mMKMapView addSubview:button];
    }
}

//------------------------------------------------------------------------------
- (void)removeMapPressed
//------------------------------------------------------------------------------
{
    [mMKMapView removeFromSuperview];
}

//------------------------------------------------------------------------------
- (void)pushViewControllerPressed
//------------------------------------------------------------------------------
{
    TestViewController *testViewController= [[TestViewController alloc] init];
    
    if ([testViewController respondsToSelector:@selector( setExtendedLayoutIncludesOpaqueBars: )]) {
        testViewController.extendedLayoutIncludesOpaqueBars= NO;
        testViewController.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [self.navigationController pushViewController:testViewController animated:YES];
}

//------------------------------------------------------------------------------
- (void)showContactsPressed
//------------------------------------------------------------------------------
{
    ABPeoplePickerNavigationController *abPeoplePickerNavigationController= [[ABPeoplePickerNavigationController alloc] init];

    abPeoplePickerNavigationController.peoplePickerDelegate = self;
    abPeoplePickerNavigationController.view.frame= CGRectMake( 0, 0, 320, self.view.frame.size.height);
    abPeoplePickerNavigationController.topViewController.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    [self presentModalViewController:abPeoplePickerNavigationController animated:YES];
}

//------------------------------------------------------------------------------
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
//------------------------------------------------------------------------------
{
    [self dismissModalViewControllerAnimated:NO];
    
    return NO;
}

//------------------------------------------------------------------------------
-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker
     shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property
                             identifier:(ABMultiValueIdentifier)identifier
//------------------------------------------------------------------------------
{
    [self dismissModalViewControllerAnimated:NO];
    
    return NO;
}

//------------------------------------------------------------------------------
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
//------------------------------------------------------------------------------
{
    [self dismissModalViewControllerAnimated:NO];
}

@end
