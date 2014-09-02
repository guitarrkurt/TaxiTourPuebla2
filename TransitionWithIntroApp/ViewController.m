//
//  ViewController.m
//  TransitionWithIntroApp
//
//  Created by guitarrkurt on 02/09/14.
//  Copyright (c) 2014 BUAP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView]; //Cargamos las vistas
    [[self SegundaPulsacion] setHidden:YES];//Ocultamos la segunda pulsación
    contadorPrimeraPulsacion = contadorSegundaPulsacion = 0;//Inicializamos las variables
    [[self ApiGoogleMaps] setHidden:YES];//OCultamos iconos
    [[self ShowTableView] setHidden:YES];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)setUpView{
    view1 = [[UIView alloc]initWithFrame:self.view.frame];
    view1.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Portada.png"]];
    
    view2 = [[UIView alloc]initWithFrame:self.view.frame];
    //view2.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Eleccion.jpg"]];
    view2.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:view1];
    [self.view sendSubviewToBack:view1];
}

-(void)doTransitionWithType:(UIViewAnimationTransition)animationTransitionType{
    if ([[self.view subviews] containsObject:view2 ]) {
        [UIView transitionFromView:view2
                            toView:view1
                          duration:2
                           options:animationTransitionType
                        completion:^(BOOL finished){
                            [view2 removeFromSuperview];
                        }];
        [self.view addSubview:view1];
        [self.view sendSubviewToBack:view1];
    }
    else{
        
        [UIView transitionFromView:view1
                            toView:view2
                          duration:2
                           options:animationTransitionType
                        completion:^(BOOL finished){
                            [view1 removeFromSuperview];
                        }];
        [self.view addSubview:view2];
        [self.view sendSubviewToBack:view2];
        
    }
}
- (IBAction)ActionPrimeraPulsacion:(id)sender {
    
    
    contadorPrimeraPulsacion++;
    
    if(contadorPrimeraPulsacion == 1){
        //Cargamos la imagen del taxi
        [self.TaxiImage setImage:[UIImage imageNamed:@"Taxi.png"]];
        [self.TaxiImage setAlpha:0.9];
        
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:2.8];
        
        CGPoint center2 = [self.TaxiImage center];
        center2.x += 800;
        
        [self.TaxiImage setCenter:center2];
        
        //End Animation
        [UIView commitAnimations];
        
        
        //Mostramos el boton
        [self.SegundaPulsacion setHidden:NO];
        [self.PrimeraPulsacion setHidden:YES];
        
    }
}

//Segunda pulsación
-(IBAction)curlUp:(id)sender{
    [self doTransitionWithType:UIViewAnimationOptionTransitionCurlUp];
    
    contadorSegundaPulsacion++;
    
    if(contadorSegundaPulsacion == 1){
        
        [self.TaxiImage setHidden:YES];
        [self.SegundaPulsacion setHidden:YES];
        [self.PrimeraPulsacion setHidden:YES];
        
        //Mostramos los botones uno y dos
        [self.ApiGoogleMaps setHidden:NO];
        [self.ShowTableView setHidden:NO];
        
    }
}



@end
