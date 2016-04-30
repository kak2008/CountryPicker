//
//  ViewController.m
//  CountryPicker
//
//  Created by Anish Kodeboyina on 12/19/15.
//  Copyright © 2015 Anish Kodeboyina. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

{
    NSInteger lastRowSelected;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.distanceMeasuringSystemUnitsArray = @[@"Feets",
                                               @"Kilometers",
                                               @"Miles",
                                               @"Yards"];
    _conversionFactorsArray = @[@3.28f,
                                @0.001,
                                @0.000621,
                                @1.093];
}


- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
    [self convert];
}


- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView
 numberOfRowsInComponent:(NSInteger)component
{
    return self.distanceMeasuringSystemUnitsArray.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView
            titleForRow:(NSInteger)row
           forComponent:(NSInteger)component
{
    return self.distanceMeasuringSystemUnitsArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    // 1. Get rate value from array with selected picker row
    float rateValue         = [self.conversionFactorsArray[row] floatValue];
    
    // 2. Get User entered value
    float metersValue       = [self.userEnteredValueInMetersTextField.text floatValue];
    
    // 3. Result value
    float resultValue       = (rateValue * metersValue);
    
    // 4. Create result string
    NSString *resultString  = [[NSString alloc]initWithFormat:@"%0.2f Meters = %0.2f %@", metersValue, resultValue, self.distanceMeasuringSystemUnitsArray[row] ];
    
    // 5. Assign created string to label
    self.measurementRepresentationLabel.text = resultString;
    
    
    lastRowSelected = [pickerView selectedRowInComponent:0];
}

- (void)convert
{
    // 1. Get rate value from array with last row selected
    float rateValue         = [self.conversionFactorsArray[lastRowSelected] floatValue];
    
    // 2. Get User entered value
    float metersValue       = [self.userEnteredValueInMetersTextField.text floatValue];
    
    // 3. Result value
    float resultValue       = (rateValue * metersValue);
    
    // 4. Create result string
    NSString *resultString  = [[NSString alloc]initWithFormat:@"%0.2f Meters = %0.2f %@", metersValue, resultValue, self.distanceMeasuringSystemUnitsArray[lastRowSelected]];
    
    // 5. Assign created string to label
    self.measurementRepresentationLabel.text = resultString;
}

//- (float)convert1 {
//    
//}

- (void) touchesBegan:(NSSet<UITouch *> *)touches
            withEvent:(UIEvent *)event
{
    UITouch* touch = [[event allTouches]anyObject];
    if ([self.userEnteredValueInMetersTextField isFirstResponder]&&[touch view]!= self.userEnteredValueInMetersTextField)
    {
        [self.userEnteredValueInMetersTextField resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}


/*
 - (float)convert1:(int)rateValue
 {
 float metersValue = [self.userEnteredValueInMetersTextField.text floatValue];
 float resultValue = (rateValue * metersValue);
 return (metersValue,resultValue);
 }
 */

@end

