//
//  PanoSelectTableViewController.m
//  
//
//  Created by Ricky Kirkendall on 4/5/16.
//
//

#import "PanoSelectTableViewController.h"
#import "ViewController.h"
@interface PanoSelectTableViewController ()

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) NSArray *images;

@property (nonatomic, strong) NSString *selectedImageName;
@property (nonatomic, strong) NSString *selectedSceneName;
@end

@implementation PanoSelectTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Select Experience";
    self.dataSource = @[@"The Andes", @"A town", @"Mountain"];
    self.images = @[@"andes.jpg", @"townhall.jpg",@"mountain.jpg"];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"goToScene"]) {
        ViewController *vc = (ViewController *)segue.destinationViewController;
        vc.sceneName = self.selectedSceneName;
        vc.imageName = self.selectedImageName;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedImageName = self.images[indexPath.row];
    self.selectedSceneName = self.dataSource[indexPath.row];
    [self performSegueWithIdentifier:@"goToScene" sender:self];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell
    cell.textLabel.numberOfLines = 0;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}


@end
