//
//  ViewController.h
//  Section_and_Index_List
//
//  Created by test on 23/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(strong, nonatomic)NSDictionary *animals;
@property(strong, nonatomic)NSArray *animalsSectionTitle;
@property(strong, nonatomic)NSArray *animalsIndexTitle;
@end

