#import <Foundation/Foundation.h>


@interface DataSource : NSObject

/*
 *  Note: These services will call their completion block at different intervals.
 *        All completion blocks will be called on the main thread.
 */

// Returns a list of StockEntity
+ (void)getStocks:(void (^)(NSArray *))completion;

// Returns a dictionary of ProductEntity. Key is ProductId, value is ProductEntity
+ (void)getAllProducts:(void (^)(NSDictionary *))completion;

// Returns a list of warehouses
+ (void)getAllWarehouses:(void (^)(NSArray *))completion;

// Returns a dictionary of StoreEntity. Key is StoreId, value is StoreEntity
+ (void)getAllStores:(void (^)(NSDictionary *))completion;

@end