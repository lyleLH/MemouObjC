//
//  ViewModelLifecycleProtocol.h
//  ImagePreEdit
//
//  Created by Tom.Liu on 2023/4/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ViewModelLifecycleProtocol <NSObject>

- (void)viewDidLoad;
- (void)viewWillAppear;
- (void)viewDidAppear;
- (void)viewWillDisappear;
- (void)viewDidDisappear;
- (void)didReceiveMemoryWarning;

@end


NS_ASSUME_NONNULL_END
