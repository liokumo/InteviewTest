#import <Foundation/Foundation.h>


@interface StockEntity : NSObject
@property(nonatomic) int id;
@property(nonatomic) int productId;
@property(nonatomic) int quantity;

/*
 See LocationType.h for enum values
*/
@property(nonatomic) int locationType;

/*
 If locationType == kLocationTypeWarehouse, then this is the the id for a WarehouseEntity.
 If locationType == kLocationTypeStore, then this is the the id for a StoreEntity.
 */
@property(nonatomic) int locationId;

@end