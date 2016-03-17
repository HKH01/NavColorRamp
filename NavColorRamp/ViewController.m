//
//  ViewController.m
//  NavColorRamp
//
//  Created by LIAN on 16/3/17.
//  Copyright © 2016年 com.Alice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

@synthesize myTable = _myTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //导航条的设置
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BJ1.png"] forBarMetrics:UIBarMetricsDefault];
    self.title = @"初始导航条";
    
    _myTable = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _myTable.delegate = self;
    _myTable.dataSource = self;
    [self.view addSubview:_myTable];
    
    NSLog(@"self.tableView.contentInset is %f",_myTable.contentInset.top);
    [_myTable addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew| NSKeyValueObservingOptionInitial context:nil];
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        [self navChange];
    }
}
-(void)navChange
{
    if (_myTable.contentOffset.y <= 64) {
        self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor blueColor] forKey:NSForegroundColorAttributeName];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BJ1.png"] forBarMetrics:UIBarMetricsDefault];
        self.title = @"初始导航条";
    }
    else if (_myTable.contentOffset.y >= 192 )
    {
        self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BJ2.png"] forBarMetrics:UIBarMetricsDefault];
        self.title = @"导航条最终状态";
        // 状态栏颜色为白色
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        
        
    }else
    {
        self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor redColor] forKey:NSForegroundColorAttributeName];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BJ3.png"] forBarMetrics:UIBarMetricsDefault];
        self.title = @"导航条中间状态";
        // 状态栏颜色为白色
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
        cell.textLabel.text = @"只是展示内容🐅🍎🐱";
    }
    return cell;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
