//
//  UIPickerView+MWBlocks.m
//
//
//  Created by Michael Weissman on 3/27/13.
//  Copyright (c) 2013 Michael Weissman. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "UIPickerView+AIPicker.h"
#import <objc/runtime.h>


static char PICKER_BLOCK_ID;
static char DS_BLOCK_ID;

@implementation UIPickerView (MWPicker)
@dynamic selectionBlock;
@dynamic localDataSource;

-(void)setSelectionBlock:(PickerSelectionBlock)selectionBlock
{
    objc_setAssociatedObject(self, &PICKER_BLOCK_ID, selectionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(PickerSelectionBlock)selectionBlock
{
    return objc_getAssociatedObject(self, &PICKER_BLOCK_ID);
}

+(UIPickerView *)pickerFromDataSource:(NSArray *)dataSource onSelection:(PickerSelectionBlock)sb
{
    UIPickerView *myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 200, 320, 200)];
    myPickerView.delegate = (id)[self class];
    myPickerView.showsSelectionIndicator = YES;
    [myPickerView setLocalDataSource:dataSource];
    [myPickerView setSelectionBlock:sb];
    return myPickerView;
}

-(id)copyWithZone:(NSZone *)zone
{
    UIPickerView * copy = [[[self class] allocWithZone:zone]init];
    return copy;
}


    //===========================================================
    //  localDataSource
    //===========================================================
- (NSArray *)localDataSource
{
    return objc_getAssociatedObject(self, &DS_BLOCK_ID);
}

- (void)setLocalDataSource:(NSArray *)aLocalDataSource
{
    objc_setAssociatedObject(self, &DS_BLOCK_ID, aLocalDataSource, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


-(NSNumber *)objectAtIndex:(NSInteger)idx{
    NSArray *ref = [self localDataSource];
    return [ref objectAtIndex:idx];
}
-(NSInteger)objectCount{
    NSArray *ref = [self localDataSource];
    return ref.count;
}

+ (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    id obj = [pickerView objectAtIndex:row];
    pickerView.selectionBlock(obj);
}

    // tell the picker how many rows are available for a given component
+ (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {

    return [pickerView objectCount];
}

    // tell the picker how many components it will have

+(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

    // tell the picker the title for a given component
+ (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%@",[pickerView objectAtIndex:row]];
}

    // tell the picker the width of each row for a given component
+(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {

    return kUIPickerViewMWPickerSectionWidth;
}

@end