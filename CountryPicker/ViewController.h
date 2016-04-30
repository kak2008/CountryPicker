//
//  ViewController.h
//  CountryPicker
//
//  Created by Anish Kodeboyina on 12/19/15.
//  Copyright © 2015 Anish Kodeboyina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,strong) NSArray *distanceMeasuringSystemUnitsArray;
@property(nonatomic,strong) NSArray *conversionFactorsArray;
@property (weak, nonatomic) IBOutlet UITextField *userEnteredValueInMetersTextField;
@property (weak, nonatomic) IBOutlet UILabel *measurementRepresentationLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *MeasuringSystemUnitsPicker;
- (IBAction)textFieldReturn:(id)sender;

@end

