//
//  ViewController.h
//  RegistrationForm
//
//  Created by Lorenzo Saraiva on 08/10/14.
//  Copyright (c) 2014 Lorenzo Saraiva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomIOS7AlertView.h"

@interface ViewController : UITableViewController <CustomIOS7AlertViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
{
    
    UITextField *myTextField;
    UIPickerView *myPickerView;

}


@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *cpfTextField;
@property (weak, nonatomic) IBOutlet UITextField *prontuarioTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UITextField *sexTextField;


@end

