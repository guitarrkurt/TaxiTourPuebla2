//
//  ViewController.h
//  TransitionWithIntroApp
//
//  Created by guitarrkurt on 02/09/14.
//  Copyright (c) 2014 BUAP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    UIView *view1;
    UIView *view2;
    NSInteger contadorPrimeraPulsacion;
    NSInteger contadorSegundaPulsacion;
}
@property (weak, nonatomic) IBOutlet UIButton *ApiGoogleMaps;
@property (weak, nonatomic) IBOutlet UIButton *ShowTableView;
@property (weak, nonatomic) IBOutlet UIButton *PrimeraPulsacion;
@property (weak, nonatomic) IBOutlet UIButton *SegundaPulsacion;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *TaxiImage;

@end
