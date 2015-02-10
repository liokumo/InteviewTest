
#import <Foundation/Foundation.h>


@interface ProductEntity : NSObject
@property (nonatomic) int id;
@property (nonatomic, strong) NSString *productNumber;
@property (nonatomic, strong) NSString *productDescription;

@end