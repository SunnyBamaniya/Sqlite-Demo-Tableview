- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
        
    
}
-(void)viewWillAppear:(BOOL)animated
{
    array = [[NSMutableArray alloc]init];
    array = [DatabaseOperation Selectplayer];

    
    NSLog(@" $$$$$$$$$$$$$$$$ %@", array);
    [self.navigationItem setTitle:@"Tableview"];
    [self.navigationItem.backBarButtonItem setTitle:@"Tableview"];
    [self.Mytable reloadData];
    objNav.navigationBarHidden = YES;
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
     target:self
     action:@selector(Add:)];
    
    

}
-(IBAction)Add:(id)sender
{
    TestViewController *t = [[TestViewController alloc]init];
    [self.navigationController pushViewController:t animated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
//    objNav.navigationBarHidden=YES;
//    [objNav.navigationBar removeFromSuperview];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)doAdd:(id)sender
{
    TestViewController *Nav = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
    [self.navigationController pushViewController:Nav animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellidentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellidentifier];
    }
    NSLog(@"%@", array);
    
    
  
    cell.textLabel.text = [[array objectAtIndex:indexPath.row] valueForKey:@"playername"];
    cell.detailTextLabel.text=[[array objectAtIndex:indexPath.row] valueForKey:@"teamname"];
    cell.tag = [[[array objectAtIndex:indexPath.row] valueForKey:@"id"] intValue];
  
   
   
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    NSString *cellText = selectedCell.textLabel.text;
    NSString *celltext1 = selectedCell.detailTextLabel.text;
    NSLog(@"%@",cellText);
    NSLog(@"%@",celltext1);
    
    
//    NSString *pname,*tname;
//    NSLog(@"row selected");
//    NSUInteger row = [indexPath row];
//    NSString *newText = [array objectAtIndex:row];
//    NSLog(@"%@",newText);
//    
  TestViewController *testview = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
//    testview.playernametextfield.text = [array objectAtIndex:indexPath.row];
    testview.strp=cellText;
    testview.strt=celltext1;
    testview.strid = [NSString stringWithFormat:@"%d",selectedCell.tag];
    
    
//
//    
   [self.navigationController pushViewController:testview animated:YES];
}
