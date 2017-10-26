//
//  ViewController.m
//  JLImageCompression
//
//  Created by Rong Mac mini on 2017/9/5.
//  Copyright © 2017年 Ronginet. All rights reserved.
//

#import "ViewController.h"
#import "JLImageCompressVC.h"

static NSString *const cellID = @"cell";

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

/** <#description#> */
@property(nonatomic,strong) UITableView *tableView;
/** <#description#> */
@property(nonatomic,strong) NSArray<NSString *> *cellDatas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"图片压缩";
    self.cellDatas = @[@"PNG图片压缩",@"JPEG图片压缩",@"GIF 图片压缩"];
    [self createTableView];
}

- (void)createTableView {
    self.tableView = [UITableView new];
    self.tableView.frame = self.view.bounds;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.cellDatas[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JLImageCompressVC *vc = [JLImageCompressVC new];
    if (indexPath.row == 0) {
        vc.title = @"PNG图片压缩";
        vc.imageName = @"1";
        vc.imageFormat = JLImageFormatPNG;
        vc.specifySize = 0.5;
    }
    
    if (indexPath.row == 1) {
        vc.title = @"JPEG图片压缩";
        vc.imageName = @"2.jpg";
        vc.imageFormat = JLImageFormatJPEG;
        vc.specifySize = 1.0;
    }
    
    if (indexPath.row == 2) {
        vc.title = @"GIF 图片压缩";
        vc.imageName = @"111.gif";
        vc.imageFormat = JLImageFormatGIF;
        vc.specifySize = 0.5;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
