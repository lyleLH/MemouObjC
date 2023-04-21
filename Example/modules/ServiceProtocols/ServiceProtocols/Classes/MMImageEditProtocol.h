//
//  MMImageEditProtocol.h
//  Pods
//
//  Created by Tom.Liu on 2023/2/24.
//

#ifndef MMImageEditProtocol_h
#define MMImageEditProtocol_h

@protocol MMImageEditProtocol <NSObject>
+ (void)updateSelectedImages:(NSArray*)assets;
@end

#endif /* MMImageEditProtocol_h */
