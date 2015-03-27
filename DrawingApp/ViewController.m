//
//  ViewController.m
//  DrawingApp
//
//  Created by Kwame Bryan on 2015-03-27.
//  Copyright (c) 2015 3e Interactive. All rights reserved.
//

#import "ViewController.h"
@import CoreGraphics;

@interface ViewController ()

@end

@implementation ViewController


-(void)awakeFromNib {
    //create a mutable path
    self.path = [[UIBezierPath alloc]init];
    self.path.lineJoinStyle = kCGLineJoinRound;
    self.path.lineCapStyle = kCGLineCapRound;
    self.path.lineWidth = 5.0;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     *  Create a mutable path
     *
     *  @return <#return value description#>
     */

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /**
     *  get the starting point
     *
     *  @return return nothing
     */
    CGPoint point = [[touches anyObject] locationInView:self.view];
    /**
     *  move the path drawing cursor to the starting point
     *
     *  @return returns nothing
     */
    [self.path moveToPoint:point];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    // get the current point
    CGPoint point = [[touches anyObject] locationInView:self.view];
    // add a new line segment to our path
    [self.path addLineToPoint:point];
    // redraw the view
    [self.view setNeedsDisplay];
    NSLog(@"Screen Touched");
}
-(void)drawRect:(CGRect) rect {
    // draw path
    [[UIColor clearColor] setFill];
    [[UIColor redColor] setStroke];
    [self.path stroke];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
