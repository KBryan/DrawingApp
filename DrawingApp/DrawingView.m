//
//  DrawingView.m
//  DrawingApp
//
//  Created by Kwame Bryan on 2015-03-27.
//  Copyright (c) 2015 3e Interactive. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView


-(void)awakeFromNib {
    //create a mutable path
    self.path = [[UIBezierPath alloc]init];
    self.path.lineJoinStyle = kCGLineJoinRound;
    self.path.lineCapStyle = kCGLineCapRound;
    self.path.lineWidth = 5;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /**
     *  get the starting point
     *
     *  @return return nothing
     */
    CGPoint point = [[touches anyObject] locationInView:self];
    /**
     *  move the path drawing cursor to the starting point
     *
     *  @return returns nothing
     */
    [self.path moveToPoint:point];
    NSLog(@"Screen Touched");
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    // get the current point
    CGPoint point = [[touches anyObject] locationInView:self];
    // add a new line segment to our path
    [self.path addLineToPoint:point];
    // redraw the view
    [self setNeedsDisplay];
    NSLog(@"Screen Moved");
}
-(void)drawRect:(CGRect) rect {
    // draw path
    [[UIColor clearColor] setFill];
    [[UIColor redColor] setStroke];
    [self.path stroke];
    NSLog(@"Drawing Path");
}
@end
