//
//  ViewController.m
//  Section_and_Index_List
//
//  Created by test on 23/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.animals = [[NSDictionary alloc]init];
    self.animalsSectionTitle = [[NSArray alloc]init];
    self.animalsIndexTitle = [[NSArray alloc]init];
    
    
    self.animals = @{
                     @"A" : @[@"Ant"],
                     @"B" : @[@"Bear",@"Black Swan", @"Buffalo"],
                     @"C" : @[@"Camel", @"Cockatoo"],
                     @"D" : @[@"Dog", @"Donkey"],
                     @"E" : @[@"Emu"],
                     @"F" : @[@"Fish"],
                     @"G" : @[@"Giraffe", @"Greater Rhea"],
                     @"H" : @[@"Hippopotamus", @"Horse"],
                     @"K" : @[@"Koala"],
                     @"L" : @[@"Lion", @"Llama"],
                     @"M" : @[@"Manatus", @"Meerkat"],
                     @"O" : @[@"Ox"],
                     @"P" : @[@"Panda", @"Peacock", @"Pig", @"Platypus", @"Polar Bear"],
                     @"R" : @[@"Rhinoceros"],
                     @"S" : @[@"Seagull"],
                     @"T" : @[@"Tasmania Devil"],
                     @"W" : @[@"Whale",  @"Whale Shark", @"Wombat"],
                     @"Z" : @[@"Zebra"],
                     
                     
                     };
    

    self.animalsSectionTitle = [[self.animals allKeys]sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    self.animalsIndexTitle = @[@"A", @"B", @"C", @"D", @"E", @"F",@"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSString *sectionTitle = [self.animalsSectionTitle objectAtIndex:section];
    
    NSArray *sectionAnimals = [self.animals objectForKey:sectionTitle];
    
    return [sectionAnimals count];

}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return [self.animalsSectionTitle objectAtIndex:section];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell.textLabel setFont:[UIFont systemFontOfSize:20.0]];
   
    
    
    cell.textLabel.textColor = [UIColor blueColor];
        // Configure the cell...
    
    NSString *sectiontitle = [self.animalsSectionTitle objectAtIndex:indexPath.section];
    NSArray *sectionAnimals = [self.animals objectForKey:sectiontitle];
    NSString *animal = [sectionAnimals objectAtIndex:indexPath.row];
    cell.textLabel.text = animal;
    cell.imageView.image = [UIImage imageNamed:[self getImageFileName:animal]];
    
    return cell;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{


    return self.animalsSectionTitle.count;
}

-(NSString *)getImageFileName : (NSString *)animalName{


    NSString *imageFileName = [[animalName lowercaseString]stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    imageFileName = [imageFileName stringByAppendingString:@".jpg"];
    return imageFileName;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{


    return self.animalsIndexTitle;
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{

    return [self.animalsSectionTitle indexOfObject:title];

}
@end
