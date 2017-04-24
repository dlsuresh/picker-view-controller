//
//  ViewController.h
//  PickerViewDropDown-Plist
//
//  Created by Suresh on 3/1/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) IBOutlet UIImageView *brandImage;
@property (strong, nonatomic) IBOutlet UIImageView *carImage;

@end

