- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"str %@",strp);
    
    playernametextfield.text = strp;
    teamnametextfield.text = strt;
    
//    playernametextfield.text = @"";
//    teamnametextfield.text=@"";
    
    
    [self.navigationItem setTitle:@"Second Screen"];
    [self.navigationItem.backBarButtonItem setTitle:@"Second Page"];
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [playernametextfield resignFirstResponder];
    [teamnametextfield resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Save:(id)sender
{
     [DatabaseOperation Insert:[NSString stringWithFormat:@"%@",playernametextfield.text] teamname:[NSString stringWithFormat:@"%@",teamnametextfield.text]];
//    ViewController *uv = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
//    [self.navigationController pushViewController:uv animated:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];
     [self clear];
    
}

- (IBAction)Delete:(id)sender
{
    [DatabaseOperation DeleteUser:strid];
//    ViewController *uv = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
//    [self.navigationController pushViewController:uv animated:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self clear];
}


-(void)clear
{
    playernametextfield.text=@"";
    teamnametextfield.text=@"";
}


- (IBAction)Update:(id)sender {
    
    [DatabaseOperation updateCategory:strid playername:[NSString stringWithFormat:@"%@",playernametextfield.text] teamname:[NSString stringWithFormat:@"%@",teamnametextfield.text]];
    [self.navigationController popToRootViewControllerAnimated:YES];
//    ViewController *uv = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
//    [self.navigationController pushViewController:uv animated:YES];
    
    [self clear];

    
}
