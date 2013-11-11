@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
{
    NSMutableArray *array;
}
@property (strong, nonatomic) IBOutlet UISearchBar *Mysearchbar;
@property (nonatomic,strong)NSMutableArray *filteredarray;
@property BOOL isFiltered;
@property (assign, nonatomic) IBOutlet UITableView *Mytable;
@property (nonatomic,strong)NSMutableArray *array;
-(IBAction)doAdd:(id)sender;
