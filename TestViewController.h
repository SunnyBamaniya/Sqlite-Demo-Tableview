@interface TestViewController : UIViewController
{
    IBOutlet UITextField *playernametextfield;
    IBOutlet UITextField *teamnametextfield;
}
@property (strong, nonatomic) IBOutlet UITextField *playernametextfield;
@property (strong, nonatomic) IBOutlet UITextField *teamnametextfield;
@property (strong,nonatomic)NSString *strp;

@property (strong,nonatomic)NSString *strt;
@property (strong,nonatomic)NSString *strid;
- (IBAction)Save:(id)sender;
- (IBAction)Delete:(id)sender;
- (IBAction)Update:(id)sender;
