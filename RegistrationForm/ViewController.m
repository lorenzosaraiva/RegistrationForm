//
//  ViewController.m
//  RegistrationForm
//
//  Created by Lorenzo Saraiva on 08/10/14.
//  Copyright (c) 2014 Lorenzo Saraiva. All rights reserved.
//

#import "ViewController.h"
#import "CustomIOS7AlertView.h"
@interface ViewController ()

@property(nonatomic, retain) UIDatePicker *dateGlobal;
@property (nonatomic, retain) UIPickerView *pickerView;
@property (nonatomic, retain) NSArray *dataArray;
@property (nonatomic, retain) UITextField *globalString;
@property NSInteger flag;
@property NSInteger indexGlobal;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.nameTextField.delegate = self;
    self.flag = 0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customIOS7dialogButtonTouchUpInside: (CustomIOS7AlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    if (self.flag == 1){
        self.sexTextField.text = self.globalString.text;
        self.flag = 0;
    }
    if (self.indexGlobal == 3){
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *data = [formatter stringFromDate:self.dateGlobal.date];
    self.dateTextField.text = data;
    self.indexGlobal = 0;
    }
    if (self.indexGlobal == 4){
    
    self.indexGlobal = 0;
    }
         [alertView close];
    return;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.indexGlobal = indexPath.row;
    CustomIOS7AlertView *alertView = [[CustomIOS7AlertView alloc] init];

    
    if (indexPath.row == 0){
        [self.nameTextField setUserInteractionEnabled:YES];
        [self.cpfTextField setUserInteractionEnabled:NO];
        [self.prontuarioTextField setUserInteractionEnabled:NO];
        [self.nameTextField becomeFirstResponder];
    }
    
    if (indexPath.row == 1){
        [self.cpfTextField setUserInteractionEnabled:YES];
        [self.nameTextField setUserInteractionEnabled:NO];
        [self.prontuarioTextField setUserInteractionEnabled:NO];
        [self.cpfTextField becomeFirstResponder];
    }
    
    if (indexPath.row == 2){
        [self.prontuarioTextField setUserInteractionEnabled:YES];
        [self.nameTextField setUserInteractionEnabled:NO];
        [self.cpfTextField setUserInteractionEnabled:NO];
        [self.prontuarioTextField becomeFirstResponder];
    }
    
    if (indexPath.row == 3){
        
        UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,0,300,300)];
        self.dateGlobal = datePicker;
        [self.dateGlobal setDatePickerMode:UIDatePickerModeDate];
        [alertView setContainerView:self.dateGlobal];
        [alertView setDelegate:self];
        [alertView show];
    }
    
    if (indexPath.row == 4){
        
        self.dataArray = [[NSArray alloc]initWithObjects:@"Masculino", @"Feminino", @"Outros",nil];
        myPickerView = [[UIPickerView alloc]init];
        myPickerView.dataSource = self;
        myPickerView.delegate = self;
        myPickerView.showsSelectionIndicator = YES;
        [alertView setContainerView:myPickerView];
        [alertView setDelegate:self];
        [alertView show];
    }
        return;
    
}

         // Number of components.
         -(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
             return 1;
         }
         
         // Total rows in our component.
         -(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
             return [self.dataArray count];
         }
         
         // Display each row's data.
         -(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
             return [self.dataArray objectAtIndex: row];
         }
         
         // Do something with the selected row.
         -(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
             self.sexTextField.text = [self.dataArray objectAtIndex: row];
             NSLog(@"To aqui");
             if (row == 2){
                 CustomIOS7AlertView *textAlertView = [[CustomIOS7AlertView alloc] init];
                 UITextField *alertTextField = [[UITextField alloc]initWithFrame:CGRectMake(20,20,300,100)];
                 self.globalString = alertTextField;
                 self.flag = 1;
                 alertTextField.placeholder = @"Digite novo";
                 [textAlertView setContainerView:alertTextField];
                 [textAlertView setDelegate:self];
                 [textAlertView show];
             
             }
         }




@end
