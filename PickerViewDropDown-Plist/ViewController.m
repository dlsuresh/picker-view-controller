//
//  ViewController.m
//  PickerViewDropDown-Plist
//
//  Created by Suresh on 3/1/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSDictionary *dict;
    NSArray *models;
    NSArray *cars;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   dict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle ]pathForResource:@"Property List" ofType:@"plist"]];
    
    NSLog(@"dictionary = %@",dict);
    cars = [dict allKeys];
    NSLog(@"%@",cars);
    NSArray *sort = [cars sortedArrayUsingSelector:@selector(compare:)];
    cars = sort;
    NSString *selectedLanguage = sort[0];
    models = dict[selectedLanguage];
    
    self.brandImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",cars[0]]];
    self.carImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",models[0]]];

    
//    self.brandImage.image = [UIImage imageNamed:@"Audi A4.jpg"];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return cars.count;
    }
    if (component == 1) {
        return models.count;
    }
    return 0;
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == 0) {
        return cars[row];
    }else
        return models[row];
   
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        NSString *selectedLan  = cars[row];
        models = dict[selectedLan];
        [self.pickerView reloadComponent:1];
        [self.pickerView selectRow:0 inComponent:1 animated:YES];
        self.carImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",cars]];

    }
    NSInteger brandRow = [self.pickerView selectedRowInComponent:0];
    NSInteger modelRow = [self.pickerView selectedRowInComponent:1];
    
    NSString *brand = cars[brandRow];
    NSString *model = models[modelRow];
    
    self.brandImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",brand]];
    self.carImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",model]];
    
}












@end
